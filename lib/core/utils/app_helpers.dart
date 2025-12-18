import 'dart:math';

import 'package:url_launcher/url_launcher.dart';

class AppHelpers {
  //for URL launcher Package
  static Future<void> launingchUrl({required String url}) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
