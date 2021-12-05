import 'dart:async';

import 'package:dg_certification_system/controller/state_abstract_control.dart';


class StateControl implements StateAbstractControl {
  final StreamController streamController;
  StateControl() : streamController = StreamController();
  @override
  void notifyListeners() {
    streamController.add('change');
  }
  @override
  void init() {
  }
  @override
  void dispose() {
    streamController.close();
  }
}
