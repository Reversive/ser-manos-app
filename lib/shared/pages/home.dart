import 'package:flutter/material.dart';
import 'package:ser_manos/features/news/presentation/news_tab.dart';
import 'package:ser_manos/features/profile/presentation/profile_tab.dart';
import 'package:ser_manos/features/volunteer/presentation/volunteer_tab.dart';
import 'package:ser_manos/shared/cells/headers/ab_tab_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ABTabHeader(tabController: tabController, onTapTab: onTapTab),
      resizeToAvoidBottomInset: false,
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          VolunteerTab(),
          ProfileTab(),
          NewsTab(),
        ],
      ),
    );
  }

  void onTapTab(int index) {
    // TODO
  }
}
