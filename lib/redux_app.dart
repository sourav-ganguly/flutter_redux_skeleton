import 'package:clean_architecture_demo/containers/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:clean_architecture_demo/models/models.dart';
import 'package:clean_architecture_demo/actions/actions.dart';
import 'package:clean_architecture_demo/models/state.dart';

class ReduxApp extends StatelessWidget {
  final Store<AppState> store;

  const ReduxApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Number Trivia',
        theme: ThemeData(
          primaryColor: Colors.green.shade800,
          accentColor: Colors.green.shade600,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Number Trivia'),
          ),
          body: HomeScreen(
              // onInit: () {
              // StoreProvider.of<AppState>(context)
              //     .dispatch(SearchRandomTriviaAction());
              // },
              ),
        ),
      ),
    );
  }
}
