import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/core/providers/location_provider.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';
import 'package:ser_manos/src/features/volunteer/providers/volunteering_provider.dart';
part 'generated/volunteering_search_controller.g.dart';

@riverpod
class VolunteeringSearchController extends _$VolunteeringSearchController {
  Timer? _debounce;
  String? _currentSearch;

  @override
  Future<List<Volunteering>> build() async {
    ref.onDispose(() {
      if (_debounce != null) {
        _debounce!.cancel();
      }
    });
    return _fetchVolunteerings(_currentSearch);
  }

  Future<List<Volunteering>> _fetchVolunteerings(String? search) async {
    final locationRepo = ref.read(locationRepositoryProvider);
    final location = await locationRepo.getCurrentLocation();
    return await ref
        .read(volunteeringServiceProvider)
        .getVolunteerings(location, search);
  }

  Future<void> search(String? search) async {
    if (_debounce != null) {
      _debounce!.cancel();
    }

    _debounce = Timer(
      const Duration(milliseconds: 300),
      () async {
        _currentSearch = search;
        state = await AsyncValue.guard(() => _fetchVolunteerings(search));
      },
    );
  }
}
