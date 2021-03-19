import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/custom_widgets/toast_animation.dart';

class ToastUtils {
  static Timer toastTimer;
  static OverlayEntry _overlayEntry;

  // static List<OverlayEntry> _overlayEntries = [];
  static int _animTime = 5;

  static void showCustomToast(BuildContext context, String message) {
    if (toastTimer == null || !toastTimer.isActive) {
      _overlayEntry = createOverlayEntry(context, message);
      Overlay.of(context).insert(_overlayEntry);
      toastTimer = Timer(Duration(seconds: _animTime), () {
        if (_overlayEntry != null) _overlayEntry.remove();
      });
    }
/*    // if (toastTimer == null || !toastTimer.isActive) {
    _overlayEntries.add(createOverlayEntry(context, message));
    Overlay.of(context).insert(_overlayEntries.last);
    toastTimer = Timer(Duration(seconds: _animTime), () {
      if (_overlayEntries.isNotEmpty) {
        _overlayEntries.first.remove();
        _overlayEntries.removeAt(0);
      }
    });
    // }*/
  }

  static OverlayEntry createOverlayEntry(BuildContext context, String message) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 50.0,
        width: MediaQuery.of(context).size.width,
        child: ToastMessageAnimation(
          time: _animTime,
          child: Card(
            margin: EdgeInsets.all(24.0),
            child: Center(child: TextWidget(message, size: 14.0, weight: FontWeight.w600, padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), ellipsis: false)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}
