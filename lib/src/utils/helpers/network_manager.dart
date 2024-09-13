import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

//TODO: Not enough to guarantee network access, work in progress

final networkManagerProvider =
    AsyncNotifierProvider<NetworkManager, bool>(NetworkManager.new);

class NetworkManager extends AsyncNotifier<bool> {
  // Instance of InternetConnectionChecker to monitor connection changes
  final _connectionChecker = InternetConnectionChecker();

  // Stream subscription to listen to connectivity status changes
  late StreamSubscription<InternetConnectionStatus> _connectivitySubcription;

  @override
  Future<bool> build() async {
    // Initialize the connection status

    bool isConnected = await InternetConnectionChecker().hasConnection;

    // Listen for future changes in connection status and call [_updateConnectionStatus]
    _connectivitySubcription =
        _connectionChecker.onStatusChange.listen(_updateConnectionStatus);

    // Use ref.onDispose to cancel the subscription when the provider is disposed
    ref.onDispose(() {
      _connectivitySubcription.cancel();
    });

    return isConnected;
  }

  void _updateConnectionStatus(InternetConnectionStatus status) {
    if (status == InternetConnectionStatus.disconnected) {
      //TODO: Show no network dialog
      state = const AsyncData(false);
    } else {
      state = const AsyncData(true);
    }
  }

  // A helper method to manually check if the device is connected to the internets
  Future<bool> isConnected() async {
    return await _connectionChecker.hasConnection;
  }
}
