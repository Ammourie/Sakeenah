#!/usr/bin/env bash
# Unified Telegram CI notification template — edits ONE message in place,
# with a block-style progress bar, instead of sending a new message per step.
#
# Usage: telegram_notify.sh <status> <title> [body_html] [percent]
#   status:  started | progress | success | failure | warning
#   percent: 0-100, optional — falls back to a sane default per status if omitted
#
# How the single-message behavior works:
#   - First call (no TG_MESSAGE_ID env set yet) sends a new message and
#     saves its message_id to $GITHUB_ENV as TG_MESSAGE_ID.
#   - Every later call in the same job sees TG_MESSAGE_ID and calls
#     editMessageText on that same message instead of sending a new one.
#   - If an edit fails (message too old, deleted, or Telegram's "not
#     modified" error on an identical body) it transparently falls back to
#     sending a fresh message and re-saves the new TG_MESSAGE_ID, so the
#     pipeline never breaks even if editing stops working mid-run.
#   - Document uploads (sendDocument) are unrelated to this and always stay
#     separate messages — Telegram can't turn a text message into a file.
set -euo pipefail

STATUS="${1:-progress}"
TITLE="${2:-Update}"
BODY="${3:-}"
PERCENT="${4:-}"

: "${TELEGRAM_BOT_TOKEN:?missing TELEGRAM_BOT_TOKEN}"
: "${TELEGRAM_CHAT_ID:?missing TELEGRAM_CHAT_ID}"

APP_NAME="${TG_APP_NAME:-Starter App}"
REF_NAME="${TG_REF_NAME:-${GITHUB_REF_NAME:-unknown}}"
RUN_NUMBER="${TG_RUN_NUMBER:-${GITHUB_RUN_NUMBER:-0}}"
RUN_URL="${TG_RUN_URL:-}"
SHORT_SHA="${TG_SHORT_SHA:-${GITHUB_SHA:0:7}}"

# ---- percent: use explicit arg, else a sane default per status ----
if [ -z "$PERCENT" ]; then
  case "$STATUS" in
    started)  PERCENT=2 ;;
    progress) PERCENT="${TG_LAST_PERCENT:-50}" ;;
    success)  PERCENT=100 ;;
    failure)  PERCENT="${TG_LAST_PERCENT:-0}" ;;
    warning)  PERCENT="${TG_LAST_PERCENT:-0}" ;;
    *)        PERCENT=0 ;;
  esac
fi
if [ -n "${GITHUB_ENV:-}" ]; then
  echo "TG_LAST_PERCENT=${PERCENT}" >> "$GITHUB_ENV"
fi

case "$STATUS" in
  started)  ICON="🚀"; LABEL="STARTED" ;;
  progress) ICON="⏳"; LABEL="IN PROGRESS" ;;
  success)  ICON="✅"; LABEL="SUCCESS" ;;
  failure)  ICON="❌"; LABEL="FAILED" ;;
  warning)  ICON="⚠️"; LABEL="WARNING" ;;
  *)        ICON="ℹ️"; LABEL="INFO" ;;
esac

# ---- 10-block progress bar, e.g. ▓▓▓▓▓░░░░░ 50% ----
FILLED=$(( PERCENT / 10 ))
[ "$FILLED" -gt 10 ] && FILLED=10
[ "$FILLED" -lt 0 ] && FILLED=0
EMPTY=$(( 10 - FILLED ))
BAR=""
for ((i = 0; i < FILLED; i++)); do BAR="${BAR}▓"; done
for ((i = 0; i < EMPTY; i++)); do BAR="${BAR}░"; done
if [ "$STATUS" = "failure" ]; then
  PROGRESS_LINE="<code>${BAR}</code> ${PERCENT}% · stopped here"
else
  PROGRESS_LINE="<code>${BAR}</code> ${PERCENT}%"
fi

HEADER="<b>${ICON} ${APP_NAME}</b>
<code>#${RUN_NUMBER}</code> · <i>${REF_NAME}</i> · <code>${SHORT_SHA}</code>
━━━━━━━━━━━━━━━━━━━━"

STEP="<b>${LABEL}</b> · ${TITLE}
${PROGRESS_LINE}"

FOOTER="━━━━━━━━━━━━━━━━━━━━"
if [ -n "$RUN_URL" ]; then
  FOOTER="${FOOTER}
🔗 <a href=\"${RUN_URL}\">Open workflow run</a>"
fi

if [ -n "$BODY" ]; then
  MSG="${HEADER}
${STEP}

${BODY}

${FOOTER}"
else
  MSG="${HEADER}
${STEP}

${FOOTER}"
fi

send_new_message() {
  curl -fsS -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${TELEGRAM_CHAT_ID}" \
    --data-urlencode "parse_mode=HTML" \
    --data-urlencode "disable_web_page_preview=true" \
    --data-urlencode "text=${MSG}"
}

edit_existing_message() {
  curl -fsS -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/editMessageText" \
    --data-urlencode "chat_id=${TELEGRAM_CHAT_ID}" \
    --data-urlencode "message_id=${TG_MESSAGE_ID}" \
    --data-urlencode "parse_mode=HTML" \
    --data-urlencode "disable_web_page_preview=true" \
    --data-urlencode "text=${MSG}"
}

if [ -n "${TG_MESSAGE_ID:-}" ]; then
  if RESPONSE=$(edit_existing_message 2>/dev/null); then
    : # edited in place, nothing else to do
  else
    echo "Edit failed (message too old, deleted, or unchanged) — sending a fresh message instead." >&2
    RESPONSE=$(send_new_message)
    NEW_MESSAGE_ID=$(echo "$RESPONSE" | jq -r '.result.message_id // empty')
    if [ -n "$NEW_MESSAGE_ID" ] && [ -n "${GITHUB_ENV:-}" ]; then
      echo "TG_MESSAGE_ID=${NEW_MESSAGE_ID}" >> "$GITHUB_ENV"
    fi
  fi
else
  RESPONSE=$(send_new_message)
  NEW_MESSAGE_ID=$(echo "$RESPONSE" | jq -r '.result.message_id // empty')
  if [ -n "$NEW_MESSAGE_ID" ] && [ -n "${GITHUB_ENV:-}" ]; then
    echo "TG_MESSAGE_ID=${NEW_MESSAGE_ID}" >> "$GITHUB_ENV"
  fi
fi
