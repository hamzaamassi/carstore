import 'package:carstore/core/config/translations/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MySharedPref {
  // get storage
  static late final GetStorage _storage;

  // STORING KEYS
  static const String _apiTokenKey = 'api_token';
  static const String _fcmTokenKey = 'fcm_token';
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';
  static const String _loggedUserId = 'logged_user_id';

  /// init get storage services
  static init() async {
    await GetStorage.init();
    _storage = GetStorage();
  }

  /// set theme current type as light theme
  static void setThemeIsLight(bool lightTheme) =>
      _storage.write(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() => _storage.read(_lightThemeKey) ?? true;

  /// save current locale
  static void setCurrentLanguage(String languageCode) =>
      _storage.write(_currentLocalKey, languageCode);

  /// get current locale
  static Locale getCurrentLocal() {
    String? langCode = _storage.read(_currentLocalKey);
    // default language is english
    if (langCode == null) {
      return LocalizationService.defaultLanguage;
    }
    return LocalizationService.supportedLanguages[langCode]!;
  }

  /// get current locale
  static bool isSelectedStartLanguage() {
    String? langCode = _storage.read(_currentLocalKey);
    return langCode != null;
  }

  /// save generated fcm token
  static void setFcmToken(String token) => _storage.write(_fcmTokenKey, token);

  /// get generated fcm token
  static String? getFcmToken() => _storage.read(_fcmTokenKey);

  /// save generated api token
  static void setApiToken(String token) => _storage.write(_apiTokenKey, token);

  /// get generated api token
  static String? getApiToken() => _storage.read(_apiTokenKey);

  /// save generated api token
  static void setLoggedUserId(String user) =>
      _storage.write(_loggedUserId, user);

  /// get generated api token
  static String? getLoggedUserId() => _storage.read(_loggedUserId);

  static void clear() {
    /*We delete one by one because keep _currentLocalKey*/
    _storage.remove(_apiTokenKey);
    _storage.remove(_fcmTokenKey);
    _storage.remove(_lightThemeKey);
    _storage.remove(_loggedUserId);
  }
}
