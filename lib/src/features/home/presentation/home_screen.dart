import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/news/presentation/news_screen.dart';
import 'package:ser_manos/src/features/profile/presentation/missing_profile_screen.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_screen.dart';
import 'package:ser_manos/src/shared/cells/headers/header.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  static const String segment = 'home';
  static const String routeName = 'home';

  const HomeScreen({
    super.key,
    this.initialIndex = 0,
  });
  final int initialIndex;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SMHeader.tab(tabController: tabController, onTap: onTap),
      resizeToAvoidBottomInset: false,
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          VolunteerScreen(),
          MissingProfileScreen(),
          NewsScreen(),
        ],
      ),
    );
  }

  void onTap(int index) {
    // TODO
  }
}
