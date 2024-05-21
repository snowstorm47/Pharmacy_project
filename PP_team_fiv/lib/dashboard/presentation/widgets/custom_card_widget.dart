import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const CustomCard(
      {super.key, this.color, required this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(1.0),
          ),
          color: color ?? Colors.grey[100],
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(12.0),
          child: child,
        ),
      ),
    );
  }
}

// decoration: BoxDecoration(
// borderRadius: const BorderRadius.all(
// Radius.circular(1.0),
// ),
// color: color ?? Colors.grey,
// ),
// child: Padding(
// padding: padding ?? const EdgeInsets.all(12.0),
// child: child,
// ),
