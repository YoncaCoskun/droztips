import 'dart:async';

import 'package:droztips/api/api.dart';
import 'package:droztips/blocs/bloc_provider.dart';
import 'package:droztips/models/tip.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc implements BlocBase {
  List<Tip> _tipList;
  BehaviorSubject<List<Tip>> _syncController = BehaviorSubject<List<Tip>>();
  Sink<List<Tip>> get inTipList => _syncController.sink;
  Stream<List<Tip>> get outTipList => _syncController.stream;
  ApplicationBloc() {
    // Read all genres from Internet
    api.getData().then((list) {
      _tipList = list;
      inTipList.add(_tipList);
    });
  }
  void dispose() {
    _syncController.close();
  }
}
