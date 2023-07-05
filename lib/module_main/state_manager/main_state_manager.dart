import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:store_web/abstracts/states/state.dart';
import 'package:store_web/module_main/service/main_service.dart';

@injectable
class MainStateManager {
  final MainService _subscriptionService;

  final PublishSubject<States> _stateSubject = PublishSubject<States>();

  final PublishSubject<AsyncSnapshot<Object?>> _captainOffersSubject =
      PublishSubject();

  Stream<States> get stateStream => _stateSubject.stream;
  Stream<AsyncSnapshot<Object?>> get captainOffersStream =>
      _captainOffersSubject.stream;

  MainStateManager(this._subscriptionService);
}
