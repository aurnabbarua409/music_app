import 'dart:developer';

import 'package:flutter/foundation.dart';

Future<void> appLog({
  required String title,
  required dynamic descrition,
}) async {
  if (kDebugMode) {
    log("===================== $title ==========================\n");
    log(descrition);
    log("========================================================\n");
  }
}
