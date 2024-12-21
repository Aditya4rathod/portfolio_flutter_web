import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  LaunchUrl._();

  static Future<void> redirectToUrl(Uri authorizationUrl) async {
    var url = authorizationUrl.toString();
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw Exception('Unable to launch');
    }
  }
}
