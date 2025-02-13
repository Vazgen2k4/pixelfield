import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivityCubit(this._connectivity) : super(ConnectivityInitial()) {
    _checkConnectivity();
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      _checkConnectivity();
    });
  }

  Future<void> _checkConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      emit(ConnectivitySuccess());
    } else {
      emit(ConnectivityFailure());
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
