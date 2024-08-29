import 'package:flutter/material.dart';

class SMGrid extends StatelessWidget {
  const SMGrid({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: child,
    );
  }
}
