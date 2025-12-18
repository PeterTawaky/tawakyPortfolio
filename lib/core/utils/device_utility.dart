import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtility {
  static get hideKeyboard => FocusManager.instance.primaryFocus?.unfocus();

  static Future<void> setStatusBarColor(
    Color color, {
    Brightness? iconBrightness,
  }) async {
    final inferred =
        ThemeData.estimateBrightnessForColor(color) == Brightness.dark
        ? Brightness.light
        : Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: iconBrightness ?? inferred, // Android
        statusBarBrightness: iconBrightness ?? inferred, // iOS
      ),
    );
  }

  /// Hide both status & navigation bars (sticky immersive).
  static Future<void> hideStatusBarAndNavigationBar() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  /// Hide only the status bar (keep bottom/nav bar visible).
  static Future<void> get hideStatusBar async =>
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: const [SystemUiOverlay.bottom],
      );

  /// Full screen (hide all system overlays).
  static get setFullScreen async => await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: const [],
  );

  /// Show only the status bar (top).
  static get showStatusBar async => await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: const [SystemUiOverlay.top],
  );

  /// Show both status & navigation bars.
  static get showSystemBars async => await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );

  static Future<void> lockOrientations({
    List<DeviceOrientation>? orientations,
  }) async {
    orientations ??= [DeviceOrientation.portraitUp];
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// Vibrate one or more times with a gap in between.
  static Future<void> vibrate({
    int count = 1,
    Duration gap = const Duration(milliseconds: 60),
  }) async {
    for (var i = 0; i < count; i++) {
      await HapticFeedback.vibrate();
      if (i < count - 1) {
        await Future.delayed(gap);
      }
    }
  }
}
