import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openLink({
    String url,
  }) =>
      _lauchUrl(url);
  static Future _lauchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
