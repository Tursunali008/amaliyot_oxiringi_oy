import 'package:amaliyot_oxiringi_oy/data/models/models.dart';
import 'package:amaliyot_oxiringi_oy/data/services/user_service.dart';

class UserRepository {
  final UserService userService;

  UserRepository({
    required this.userService,
  });

  Future<User> getUser() async {
    return await userService.getUser();
  }
}
