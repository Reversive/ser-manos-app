import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';
import 'package:ser_manos/src/features/volunteer/providers/volunteering_provider.dart';
part 'volunteering_search_controller.g.dart';

// TODO: Add location provider

@riverpod
class VolunteeringSearchController extends _$VolunteeringSearchController {
  Timer? _debounce;

  @override
  Future<List<Volunteering>> build() async {
    ref.onDispose(() {
      if (_debounce != null) {
        _debounce!.cancel();
      }
    });

    return await ref
        .read(volunteeringServiceProvider)
        .getVolunteerings(null, null);
  }

  Future<void> search(String? search) async {
    if (_debounce != null) {
      _debounce!.cancel();
    }

    _debounce = Timer(
      const Duration(milliseconds: 300),
      () async {
        state = await AsyncValue.guard(() => ref
            .read(volunteeringServiceProvider)
            .getVolunteerings(null, search));
      },
    );
  }
}
