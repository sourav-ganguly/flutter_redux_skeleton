import 'package:clean_architecture_demo/models/models.dart';
import 'package:clean_architecture_demo/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:clean_architecture_demo/actions/actions.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // StoreProvider.of<AppState>(context).dispatch(SearchRandomTriviaAction());
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  _getMessageDisplayView(state),
                  SizedBox(height: 20),
                  // Bottom half
                  TriviaControls(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getMessageDisplayView(AppState state) {
    if (state.isLoading) {
      return LoadingWidget();
    } else if (state.trivia == null) {
      return MessageDisplay(
        message: 'Start searching!',
      );
    } else {
      return TriviaDisplay(numberTrivia: state.trivia);
    }
  }
}
