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

  PublishSubject<int> _favoriteController = PublishSubject<int>();
  Sink<int> get inIndex => _favoriteController.sink;
  Observable<int> get outIndex => _favoriteController.stream;

  ApplicationBloc() {
    // Read all genres from Internet
    api.getData().then((list) {
      _tipList = list;
      inTipList.add(_tipList);
    });

    _favoriteController.stream.listen((index) {
      addToFav(index);
    });
  }

  addToFav(int index) {
    _tipList[index].setFavorite();
    inTipList.add(_tipList);
  }

  void dispose() {
    _syncController.close();
    _favoriteController.close();
  }
}
