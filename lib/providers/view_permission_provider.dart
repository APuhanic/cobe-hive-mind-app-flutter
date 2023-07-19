import 'package:cobe_hive_mobile_app/leave_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final viewPermissionProvider =
    StateProvider.autoDispose<ViewPermission>((ref) => ViewPermission.everyone);
