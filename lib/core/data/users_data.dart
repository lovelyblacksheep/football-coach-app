import 'package:coachinho/core/data/raw/users.dart';

import './models/user.dart';

class UsersData {
  static List<User> data =
      usersRawData.map<User>((e) => User.fromJson(e)).toList();
}
