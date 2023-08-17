import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedUserProvider = StateProvider<User>((ref) => User());
