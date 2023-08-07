import 'package:cobe_hive_mobile_app/data/repository/absence_repository.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/cobe_api_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final absenceRepositoryProvider = Provider<AbsenceRepository>(
    (ref) => AbsenceRepository(ref.read(cobeApiProvider)));
