import 'package:dashboard_flutter/services/global.dart';
import 'package:flutter/material.dart';

class OverlayPop {
  static OverlayEntry overlayEntry;
  static bool isShow = false;
  static bool isCanHide = true;

  static show(WidgetBuilder widgetBuilder) {
    if (isShow) return;
    isShow = true;
    overlayEntry = null;
    overlayEntry = OverlayEntry(builder: widgetBuilder);
    Global.overlay.insert(overlayEntry);
  }

  static hide() {
    if (!canHide) return;
    overlayEntry?.remove();
    overlayEntry = null;
    isShow = false;
    isCanHide = true;
  }

  static bool get  canHide {
    if (isCanHide && isShow && overlayEntry != null)
      return true;
    else
      return false;
  }
}
