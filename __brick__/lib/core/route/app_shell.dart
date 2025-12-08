import 'package:{{project_name}}/core/constants/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    final curIndex = widget.navigationShell.currentIndex;
    return Scaffold(
      backgroundColor: ColorApp.pureWhite,
      bottomNavigationBar: BottomNavigationBar(
        items: [],
        onTap: (index) => widget.navigationShell.goBranch(index),
      ),
      body: widget.navigationShell,
    );
  }
}
