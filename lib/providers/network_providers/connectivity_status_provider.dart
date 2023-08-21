import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final internetConnectionProvider =
    StateNotifierProvider<InternetConnectionNotifier, bool>(
  (ref) => InternetConnectionNotifier(),
);

class InternetConnectionNotifier extends StateNotifier<bool> {
  StreamSubscription<InternetConnectionStatus>? internetConnectionSubscription;

  InternetConnectionNotifier() : super(true) {
    _setInternetCheckParams();
    _checkForInitialConnection();
    listenForInternetConnection();
  }

  @override
  void dispose() {
    super.dispose();
    internetConnectionSubscription?.cancel();
  }

  Future<void> listenForInternetConnection() async {
    internetConnectionSubscription =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        state = status == InternetConnectionStatus.connected;
      },
    );
  }

  _setInternetCheckParams() {
    InternetConnectionChecker.createInstance(
      checkTimeout: const Duration(seconds: 1),
      checkInterval: const Duration(seconds: 1),
    );
  }

  _checkForInitialConnection() async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    state = isConnected;
  }
}
