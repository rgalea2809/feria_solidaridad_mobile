import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherServiceType {
  Future<void> openUrl(String url);
}

class UrlLauncherService implements UrlLauncherServiceType {
  @override
  Future<void> openUrl(String url) async {
    try {
      Uri? uri = Uri.parse(url);
      await launchUrl(uri);
    } catch (e) {
      return;
    }
  }
}
