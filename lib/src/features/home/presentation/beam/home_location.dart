import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/home/presentation/home_screen.dart';
import 'package:ser_manos/src/features/news/presentation/news_detail_screen.dart';
import 'package:ser_manos/src/features/news/presentation/news_screen.dart';
import 'package:ser_manos/src/features/profile/presentation/edit_profile_screen.dart';
import 'package:ser_manos/src/features/profile/presentation/profile_screen.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_detail_screen.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_screen.dart';

class HomeLocation extends BeamLocation {
  HomeLocation({RouteInformation? routeInfo}) : super(routeInfo);
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    final uri = state.routeInformation.uri;
    final currentData =
        Beamer.of(context).currentBeamLocation.data as Map<String, dynamic>?;
    final volunteeringIndex =
        currentData != null ? currentData["volunteeringIndex"] ?? '' : '';
    print(
        "DEBUG::: uri path is ${uri.path} --- ${uri.path.contains(NewsScreen.route)}");
    return [
      if (uri.path.contains(VolunteerScreen.route) ||
          uri.path.contains(HomeScreen.route))
        const BeamPage(
          key: ValueKey(VolunteerScreen.routeName),
          title: 'Home',
          child: HomeScreen(
            initialIndex: 0,
          ),
        ),
      if (uri.path.contains(VolunteerScreen.route) &&
          uri.queryParameters.containsKey("id"))
        BeamPage(
          key: ValueKey('volunteer-${uri.queryParameters["id"]}'),
          title: 'Volunteer #${uri.queryParameters["id"]}',
          child: VolunteerDetailScreen(id: uri.queryParameters["id"]!),
        ),
      if (uri.path.contains(ProfileScreen.route))
        const BeamPage(
          key: ValueKey(ProfileScreen.routeName),
          title: 'Profile',
          child: HomeScreen(
            initialIndex: 1,
          ),
        ),
      if (uri.path.contains(ProfileScreen.route) &&
          uri.path.contains(EditProfileScreen.route))
        BeamPage(
          key: const ValueKey(EditProfileScreen.routeName),
          title: 'Profile edit',
          child: EditProfileScreen(
            volunteeringIndex: volunteeringIndex,
          ),
        ),
      if (uri.path.contains(NewsScreen.route))
        const BeamPage(
          key: ValueKey(NewsScreen.routeName),
          title: 'News',
          child: HomeScreen(
            initialIndex: 2,
          ),
        ),
      if (uri.path.contains(NewsScreen.route) &&
          uri.queryParameters.containsKey("id"))
        BeamPage(
          key: ValueKey('news-${uri.queryParameters["id"]}'),
          title: 'News #${uri.queryParameters["id"]}',
          child: NewsDetailScreen(id: uri.queryParameters["id"]!),
        ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => [
        VolunteerScreen.route,
        NewsScreen.route,
        VolunteerDetailScreen.route,
        NewsDetailScreen.route,
        ProfileScreen.route,
        EditProfileScreen.route,
      ];
}
