import 'dart:async';
import 'dart:collection';
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

  PublishSubject<int> _favController = PublishSubject<int>();
  Sink<int> get inIndex => _favController.sink;
  Observable<int> get outIndex => _favController.stream;

//get the total number of favorites
  BehaviorSubject<int> _favTotalController = new BehaviorSubject<int>();
  Sink<int> get inTotalFav => _favTotalController.sink;
  Stream<int> get outTotalFav => _favTotalController.stream;

  //get the list of all favorite movies
  BehaviorSubject<List<Tip>> _favoritesController =
      new BehaviorSubject<List<Tip>>();
  Sink<List<Tip>> get _inFavorites => _favoritesController.sink;
  Stream<List<Tip>> get outFavorites => _favoritesController.stream;

  ApplicationBloc() {
    // Read all genres from Internet
    api.getData().then((list) {
      _tipList = list;
      inTipList.add(_tipList);
    });

    _favController.stream.listen((index) {
      addToFav(index);
    });
  }

  addToFav(int index) {
    //show all list
    _tipList[index].setFavorite();
    inTipList.add(_tipList);

    // count total favorite
    item = _tipList[index];
    if (item.favorite) {
      _favorites.add(item);
      inTotalFav.add(_favorites.length);
    } else if (!item.favorite) {
      _favorites.remove(item);
      inTotalFav.add(_favorites.length);
    }

    // The new list of all favorite movies
    _inFavorites.add(UnmodifiableListView(_favorites));
  }

  void dispose() {
    _syncController.close();
    _favController.close();
    _favTotalController.close();
    _favoritesController.close();
  }
}
