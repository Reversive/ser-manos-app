import 'package:ser_manos/src/features/auth/models/user.dart';
import 'package:ser_manos/src/features/profile/models/gender.dart';

Stream<User> currentUserProviderMock(ref) async* {
  yield const User(
    uuid: '1',
    name: '',
    surname: '',
    favoriteVolunteerings: [],
    image: '',
    email: '',
    birthdate: '',
    phone: '',
    gender: Gender.male,
    completed: true,
  );
}

Stream<User> currentUserIncompleteProviderMock(ref) async* {
  yield const User(
    uuid: '1',
    name: '',
    surname: '',
    favoriteVolunteerings: [],
    image: '',
    email: '',
    birthdate: '',
    phone: '',
    gender: Gender.male,
    completed: false,
  );
}
