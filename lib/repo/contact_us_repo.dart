import 'package:url_launcher/url_launcher.dart';

class ContactUsRepo {
  static void sendEmail(
      {required String name,
      required String email,
      required String message}) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'faroodcp9@gmail.com',
        query: encodeQueryParameters(<String, String>{
          'name': name,
          'email': email,
          'subject': 'From Quotes App',
          'body': message,
        }));

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch email';
    }
  }
}
