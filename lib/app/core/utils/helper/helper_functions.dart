import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/text.dart';
import '../popups/popups.dart';

class THelperFunctions {
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static Future<DateTime?> toggleDatePicker(DateTime? initialDate) async {
    return await showDatePicker(
      context: Get.context!,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year, 1, 1),
      lastDate: DateTime.utc(2025, 10, 16),
    );
  }

  static Future<TimeOfDay?> toggleClockPicker() async {
    return await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
  }

  static Future<void> launchLink(String url) async {
    try {
      final link = Uri.parse(url);
      if (await canLaunchUrl(link)) {
        await launchUrl(link);
      } else {
        throw 'Could not launch $link';
      }
    } catch (e) {
      TPopup.errorSnackbar(title: TTexts.ohSnap, message: e.toString());
    }
  }

  static int createUniqueId() {
    return DateTime.now().microsecondsSinceEpoch.remainder(3);
  }
}
