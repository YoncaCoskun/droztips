import 'package:droztips/blocs/application_bloc.dart';
import 'package:droztips/blocs/bloc_provider.dart';
import 'package:droztips/blocs/favorite_bloc.dart';
import 'package:droztips/pages/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
//  debugPrintRebuildDirtyWidgets = true;
  return runApp(BlocProvider<ApplicationBloc>(
    bloc: ApplicationBloc(),
    child: BlocProvider<FavoriteBloc>(
      bloc: FavoriteBloc(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
