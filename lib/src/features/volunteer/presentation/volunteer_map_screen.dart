import 'package:beamer/beamer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/providers/location_provider.dart';
import 'package:ser_manos/src/features/volunteer/controller/volunteering_search_controller.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_screen.dart';
import 'package:ser_manos/src/features/volunteer/providers/volunteering_provider.dart';
import 'package:ser_manos/src/design-system/atoms/icon.dart';
import 'package:ser_manos/src/design-system/cells/cards/card.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/search_input.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class VolunteerMapScreen extends HookConsumerWidget {
  const VolunteerMapScreen({
    super.key,
    required this.onIconPressed,
  });
  final void Function() onIconPressed;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(
      -34.62283169075434,
      -58.44644063941437,
    ),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = useState<GoogleMapController?>(null);
    final markers = useState(<Marker>{});
    final locationOn = useState(BitmapDescriptor.defaultMarker);
    final locationOnOutlined = useState(BitmapDescriptor.defaultMarker);
    final volunteerings = ref.watch(volunteeringSearchControllerProvider);
    final currentIndex = useState(0);
    final currentLocationData = ref.watch(currentLocationProvider);
    final currentLocation =
        useState(const LatLng(-34.62283169075434, -58.44644063941437));

    currentLocationData.whenData(
      (currLocation) {
        if (currLocation == null) return;
        currentLocation.value = LatLng(currLocation.lat, currLocation.lng);
      },
    );

    void initMarkers() async {
      locationOn.value = await const SMIcon(
        size: 32,
        icon: Icons.location_on,
        activeColor: SMColors.secondary200,
        active: true,
      ).toBitmapDescriptor();

      locationOnOutlined.value = await const SMIcon(
        size: 32,
        icon: Icons.location_on_outlined,
        activeColor: SMColors.secondary200,
        active: true,
      ).toBitmapDescriptor();
    }

    useEffect(() {
      initMarkers();
      return null;
    }, const []);

    volunteerings.whenData(
      (volunteers) {
        markers.value.clear();
        currentIndex.value = currentIndex.value > volunteers.length - 1
            ? volunteers.length - 1
            : currentIndex.value;
        for (int i = 0; i < volunteers.length; i++) {
          final marker = Marker(
            markerId: MarkerId(volunteers[i].name),
            position: LatLng(
              volunteers[i].location.lat,
              volunteers[i].location.lng,
            ),
            icon: i == currentIndex.value
                ? locationOn.value
                : locationOnOutlined.value,
          );
          markers.value.add(marker);
        }

        mapController.value!.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(
              volunteers[currentIndex.value].location.lat,
              volunteers[currentIndex.value].location.lng,
            ),
          ),
        );
      },
    );

    final TextEditingController searchController = useTextEditingController();

    return volunteerings.when(
      data: (volunteers) => Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialPosition,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomGesturesEnabled: false,
            markers: markers.value,
            onMapCreated: (controller) {
              mapController.value = controller;
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 16,
                  right: 16,
                ),
                child: SMSearchInput(
                  controller: searchController,
                  onIconPressed: onIconPressed,
                  suffixIcon: Icons.list,
                  onChanged: (value) => ref
                      .read(volunteeringSearchControllerProvider.notifier)
                      .search(searchController.text),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: SMButton.floating(
                      icon: Icons.near_me,
                      onPressed: () => {
                        mapController.value!.animateCamera(
                          CameraUpdate.newLatLng(currentLocation.value),
                        ),
                      },
                    ),
                  ),
                  const SMGap.vertical(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: volunteers.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                            child: SMCard.noVolunteerings(),
                          )
                        : CarouselSlider(
                            items: volunteers
                                .map(
                                  (voluntary) => SMCard.volunteer(
                                    volunteer: voluntary,
                                    margin: const EdgeInsets.only(right: 8),
                                    onTap: () => Beamer.of(context).beamToNamed(
                                      '${VolunteerScreen.route}?id=${volunteers.indexOf(voluntary)}',
                                      beamBackOnPop: true,
                                    ),
                                    vacancies: ref
                                        .watch(volunteeringVacanciesProvider(
                                            voluntary.id))
                                        .when(
                                          data: (vacancies) => vacancies,
                                          error: (e, s) => 0,
                                          loading: () => 0,
                                        ),
                                  ),
                                )
                                .toList(),
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
                              height: 236,
                              viewportFraction: 0.87,
                              onPageChanged: (index, reason) =>
                                  currentIndex.value = index,
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: SMTypography.body01(
          'Error: $error',
          color: SMColors.error100,
        ),
      ),
    );
  }
}
