import 'package:hooks_riverpod/hooks_riverpod.dart';

final emailProvider = StateProvider.autoDispose<String>((ref) => '');

final passwordProvider = StateProvider.autoDispose<String>((ref) => '');

final isVisibleProvider = StateProvider<bool>((ref) => true);
