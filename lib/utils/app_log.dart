import 'package:flutter/foundation.dart';

Future<void> appLog({
  required String title,
  required dynamic descrition,
}) async {
  if (kDebugMode) {
    print("===================== $title ==========================\n");
    print(descrition);
    print("========================================================\n");
  }
}
