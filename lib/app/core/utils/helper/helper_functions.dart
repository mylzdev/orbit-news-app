import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunctions {
  static Future<void> launchLink(String url) async {
    try {
      final link = Uri.parse(url);
      if (await canLaunchUrl(link)) {
        await launchUrl(link);
      } else {
        throw 'Could not launch $link';
      }
    } catch (e) {
      Get.snackbar('Oops', 'Something went wrong while launching url');
    }
  }
}
