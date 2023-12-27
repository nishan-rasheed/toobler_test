import 'dart:developer';

import 'package:flutter/foundation.dart';

customLog(String text) {
  log(text);
}

customPrint(String text) {
  if (kDebugMode) {
    print(text);
  }
}
