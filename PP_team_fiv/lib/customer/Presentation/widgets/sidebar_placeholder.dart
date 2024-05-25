// lib/presentation/widgets/sidebar_placeholder.dart

import 'package:flutter/material.dart';

class SidebarPlaceholder extends StatelessWidget {
  const SidebarPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 306,
      height: 1024,
      color: Colors.grey[300],
      child: const Center(
        child: Text(
          'Sidebar Placeholder',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }
}
