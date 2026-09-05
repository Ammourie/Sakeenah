import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../common/app_config.dart';
import '../common/local_storage.dart';
import '../constants/app/app_constants.dart';
import '../models/chat_message_data.dart';
import '../models/chat_ready_info.dart';
import '../models/message_sent_info.dart';
import '../models/receive_message_info.dart';

class ChatSocket {
  Map<String, dynamic> _headers = {};
  Socket? _socket;

  ChatSocket() {
    if (LocalStorage.hasToken) {
      final token = LocalStorage.authToken;
      final os = AppConfig().os;
      final appVersion = AppConfig().appVersion;
      if (os != null) _headers[AppConstants.HEADER_OS] = '$os';
      if (appVersion != null)
        _headers[AppConstants.HEADER_APP_VERSION] = '$appVersion';
      _headers[AppConstants.HEADER_AUTH] = '$token';
    }
    _headers[AppConstants.HEADER_DEVICE_ID] = AppConfig().deviceId;
    _headers[AppConstants.HEADER_LANGUAGE] =
        Intl.getCurrentLocale() == AppConstants.LANG_AR
            ? '${Intl.getCurrentLocale()}-sy'
            : Intl.getCurrentLocale() == AppConstants.LANG_EN
            ? '${Intl.getCurrentLocale()}-us'
            : 'ku';
  }

  void connect({
    required String url,
    required VoidCallback onConnect,
    required VoidCallback onError,
  }) {
    final socket = io(
      url,
      OptionBuilder()
          .setTransports(['websocket'])
          .setExtraHeaders(_headers)
          .setAuth({"token": LocalStorage.authToken})
          .enableForceNewConnection()
          .build(),
    );

    socket.onConnect((_) => onConnect.call());
    socket.onConnectError((_) {
      _socket?.close();
      onError.call();
    });
    socket.onReconnectError((_) {
      _socket?.close();
      onError.call();
    });
    socket.onError((_) {
      _socket?.close();
      onError.call();
    });
    _socket = socket;
  }

  void emitStartChat() {
    debugPrint("emitStartChat");
    _socket?.emit("startChat", {
      "isGroup": true,
      "groupName": "CUSTOMER_SUPPORT",
    });
  }

  void emitSendMessage(ChatMessageData message) {
    debugPrint("emitSendMessage");
    _socket?.emit("sendMessage", message.toMap());
  }

  void onChatReady(void Function(ChatReadyInfo) onReceived) {
    _socket?.on('chatReady', (data) {
      debugPrint("onChatReady: $data");
      onReceived.call(ChatReadyInfo.fromMap(data));
    });
  }

  void onMessageSent(void Function(MessageSentInfo) onReceived) {
    _socket?.on("messageSent", (data) {
      debugPrint("messageSent: $data");
      onReceived.call(MessageSentInfo.fromMap(data));
    });
  }

  void onReceiveMessage(void Function(ReceiveMessageInfo) onReceived) {
    _socket?.on("receiveMessage", (data) {
      debugPrint("onReceiveMessage: $data");
      onReceived.call(ReceiveMessageInfo.fromMap(data));
    });
  }

  void clearListeners() => _socket?.clearListeners();

  void disposeSocket() => _socket?.dispose();
}
