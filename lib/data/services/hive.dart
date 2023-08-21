import 'dart:convert';

import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();

  const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  final encryptionKeyString = await secureStorage.read(key: 'key');
  if (encryptionKeyString == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: 'key',
      value: base64UrlEncode(key),
    );
  }
  final key = await secureStorage.read(key: 'key');
  final encryptionKeyUint8List = base64Url.decode(key!);

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserStatusAdapter());

  await Hive.openBox<User>('users',
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
  await Hive.openBox<LeaveRequest>('absences',
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
}
