import 'package:url_launcher/url_launcher.dart';

class AboutRepo {
  static void visitWebsite({required String url}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }
}
