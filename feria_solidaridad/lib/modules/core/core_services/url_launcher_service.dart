import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherServiceType {
  Future<void> openUrl(String url);
}

class UrlLauncherService implements UrlLauncherServiceType {
  @override
  Future<void> openUrl(String url) async {
    try {
      Uri? uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print("Cannot launch url");
      }
    } catch (e) {
      return;
    }
  }
}

class UrlLauncherServiceMock implements UrlLauncherServiceType {
  @override
  Future<void> openUrl(String url) async {
    try {
      Uri? uri = Uri.parse("https://www.fluttercampus.com");
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        print("Cannot launch url");
      }
    } catch (e) {
      return;
    }
  }
}
