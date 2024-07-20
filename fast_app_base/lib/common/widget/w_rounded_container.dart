import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? radius;
  final Color? backgroundColor;

  const RoundedContainer(
      {required this.child,
      super.key,
      this.radius,
      this.backgroundColor,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: backgroundColor ?? context.appColors.roundedLayoutBackground,
          borderRadius: BorderRadius.circular(radius ?? 20)),
      child: child,
    );
  }
}
