import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/news/presentation/news_tab.dart';
import 'package:ser_manos/src/features/profile/presentation/profile_tab.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_tab.dart';
import 'package:ser_manos/src/shared/cells/headers/header.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage>
    with TickerProviderStateMixin {
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
      appBar: SMHeader.tab(tabController: tabController, onTap: onTapTab),
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
