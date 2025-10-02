import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCommonFunction {
  static void showSnackbar({
    required String title,
    required String text,
    required bool isSuccess,
  }) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      text,
      titleText: Text(
        title,
        softWrap: true,
        style: TextStyle(
          color: isSuccess
              ? const Color.fromARGB(255, 33, 109, 35)
              : Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      messageText: Text(
        text,
        softWrap: true,
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      icon: Icon(
        isSuccess ? Icons.check_circle : Icons.close_sharp,
        color: isSuccess ? Colors.green : Colors.red,
        size: 30,
      ),
      shouldIconPulse: false,
      borderRadius: 10,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
      borderColor: Colors.deepOrange,
      borderWidth: 2,
      backgroundGradient: LinearGradient(
        colors: [Colors.white, Colors.deepOrangeAccent],
      ),
    );
  }
}
