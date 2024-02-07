import 'package:url_launcher/url_launcher.dart';

class CommonUtil {
  static launchURL(String? url) async {
    final uri = Uri.tryParse(url ?? '');
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}