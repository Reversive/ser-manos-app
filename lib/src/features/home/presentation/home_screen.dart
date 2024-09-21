import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/features/news/presentation/news_screen.dart';
import 'package:ser_manos/src/features/profile/presentation/profile_screen.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_screen.dart';
import 'package:ser_manos/src/shared/cells/headers/header.dart';

class HomeScreen extends HookWidget {
  static const String route = '/home';
  static const String segment = 'home';
  static const String routeName = 'home';

  const HomeScreen({
    super.key,
    this.initialIndex = 0,
  });

  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    final TabController tabController = useTabController(
      initialLength: 3,
      initialIndex: initialIndex,
    );
    return Scaffold(
      appBar: SMHeader.tab(tabController: tabController),
      resizeToAvoidBottomInset: false,
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          VolunteerScreen(),
          ProfileScreen(),
          NewsScreen(),
        ],
      ),
    );
  }
}
