import 'package:flutter/material.dart';

class BottomSheetManager {
  const BottomSheetManager();

  static Future<void> showBottomSheetModal({
    required BuildContext context,
    required Widget content,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: true,
      enableDrag: false,
      builder: (BuildContext context) => content,
    );
  }
}
