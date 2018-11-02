import 'dart:collection';

import 'package:droztips/blocs/bloc_provider.dart';
import 'package:droztips/models/tip.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteBloc implements BlocBase {
//all favorite tips
  final Set<Tip> _favorites = Set<Tip>();

  //new add favorite tip
  BehaviorSubject<Tip> _favoriteAddController = new BehaviorSubject<Tip>();
  Sink<Tip> get inAddFavorite => _favoriteAddController.sink;

  //remove favourite tip
  BehaviorSubject<Tip> _favoriteRemoveController = new BehaviorSubject<Tip>();
  Sink<Tip> get inRemoveFavorite => _favoriteRemoveController.sink;

  //all favorites tips
  BehaviorSubject<List<Tip>> _favoritesController =
      new BehaviorSubject<List<Tip>>(seedValue: []);
  Sink<List<Tip>> get _inFavorites => _favoritesController.sink;
  Stream<List<Tip>> get outFavorites => _favoritesController.stream;

  FavoriteBloc() {
    _favoriteAddController.listen(_handleAddFavorite);
    _favoriteRemoveController.listen(_handleRemoveFavorite);
  }

  void _handleAddFavorite(Tip tip) {
    // Add the movie to the list of favorite ones
    _favorites.add(tip);

    _notify();
  }

  void _handleRemoveFavorite(Tip tip) {
    _favorites.remove(tip);

    _notify();
  }

  void _notify() {
    // The new list of all favorite tips
    _inFavorites.add(UnmodifiableListView(_favorites));
  }

  void dispose() {
    _favoriteAddController.close();
    _favoriteRemoveController.close();
    _favoritesController.close();
  }
}
