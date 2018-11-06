import 'dart:async';
import 'package:droztips/api/api.dart';
import 'package:droztips/blocs/bloc_provider.dart';
import 'package:droztips/models/tip.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc implements BlocBase {
  final Set<Tip> _favorites = Set<Tip>();
  Tip item;

  List<Tip> _tipList;
  BehaviorSubject<List<Tip>> _syncController = BehaviorSubject<List<Tip>>();
  Sink<List<Tip>> get inTipList => _syncController.sink;
  Stream<List<Tip>> get outTipList => _syncController.stream;

  PublishSubject<int> _favoriteController = PublishSubject<int>();
  Sink<int> get inIndex => _favoriteController.sink;
  Observable<int> get outIndex => _favoriteController.stream;

  BehaviorSubject<int> _favTotalController = new BehaviorSubject<int>();
  Sink<int> get inTotalFav => _favTotalController.sink;
  Stream<int> get outTotalFav => _favTotalController.stream;

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
    item = _tipList[index];
    if (item.favorite) {
      _favorites.add(item);
      inTotalFav.add(_favorites.length);
    } else if (!item.favorite) {
      _favorites.remove(item);
      inTotalFav.add(_favorites.length);
    }
  }

  void dispose() {
    _syncController.close();
    _favoriteController.close();
    _favTotalController.close();
  }
}
