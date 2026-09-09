# Sakeenah · سكينة

<p align="center">
  <a href="https://github.com/Ammourie/Mobile/releases/latest">
    <img src="https://img.shields.io/github/v/release/Ammourie/Mobile?label=Download%20APK&style=for-the-badge&color=0F4C3A" alt="Download latest release" />
  </a>
</p>

<p align="center">
  <a href="README.en.md"><strong>English documentation</strong></a>
  &nbsp;|&nbsp;
  <a href="README.ar.md"><strong>التوثيق العربي</strong></a>
</p>

---

**Sakeenah** is a Flutter app for daily prayer times and Quran radio — bilingual (English / Arabic), light & dark themes, Clean Architecture.

| | |
|---|---|
| **Package name** | `com.ammourie.sakeenah` |
| **Version** | `1.0.0+1` |
| **Repository** | [github.com/Ammourie/Mobile](https://github.com/Ammourie/Mobile) |

## Documentation

| Language | File | Contents |
|----------|------|----------|
| **English** | [README.en.md](README.en.md) | Install, architecture, packages, features |
| **Arabic** | [README.ar.md](README.ar.md) | التثبيت، البنية، الحزم، الميزات |

## Quick start

```bash
git clone https://github.com/Ammourie/Mobile.git
cd Mobile
fvm install && fvm use
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
fvm dart run intl_utils:generate
fvm flutter run
```

<p align="center">
  <sub>Sakeenah · سكينة — Prayer times & Quran Radio</sub>
</p>
