import 'package:flutter/widgets.dart';
import 'package:ieee_flutter_app/core/constants/widget_size.dart';

class WidgetPadding extends EdgeInsets {
  const WidgetPadding.horizontal10() : super.symmetric(horizontal: WidgetSize.size10);
  const WidgetPadding.horizontal14() : super.symmetric(horizontal: WidgetSize.size14);

  const WidgetPadding.all12() : super.all(WidgetSize.size12);
  const WidgetPadding.all16() : super.all(WidgetSize.size16);
}
