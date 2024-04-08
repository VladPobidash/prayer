import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding = const EdgeInsets.only(left: 12),
    this.margin,
    this.border,
  });

  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final BoxBorder? border;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(8),
        border: border,
      ),
      child: child,
    );
  }
}
