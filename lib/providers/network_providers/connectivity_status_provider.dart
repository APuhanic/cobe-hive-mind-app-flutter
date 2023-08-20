//statenotifier provivder for connectivity status with conectivity_plus package

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ConnectivityStatus { notDetermined, isConnected, isDisonnected }

final connectivityStatusProvider =
    StateNotifierProvider<ConnectivityStatusProvider, ConnectivityStatus>(
        (ref) => ConnectivityStatusProvider());

class ConnectivityStatusProvider extends StateNotifier<ConnectivityStatus> {
  ConnectivityStatusProvider() : super(ConnectivityStatus.notDetermined) {
    checkConnectivity();
  }

  Future<ConnectivityStatus> checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      state = ConnectivityStatus.isDisonnected;
      return state;
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      state = ConnectivityStatus.isConnected;
      return state;
    }
    return ConnectivityStatus.notDetermined;
  }
}
