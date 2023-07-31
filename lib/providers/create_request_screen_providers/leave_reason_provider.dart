import 'package:hooks_riverpod/hooks_riverpod.dart';

final leaveReasonProvider = StateProvider.autoDispose<String>((ref) => '');
