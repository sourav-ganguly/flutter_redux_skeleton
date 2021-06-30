// import 'package:clean_architecture_demo/presentation/bloc/number_trivia_bloc.dart';
// import 'package:clean_architecture_demo/presentation/bloc/number_trivia_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:clean_architecture_demo/models/models.dart';
import 'package:clean_architecture_demo/actions/actions.dart';
import 'package:clean_architecture_demo/models/state.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({
    Key key,
  }) : super(key: key);

  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: dispatchConcrete,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: RaisedButton(
                child: Text('Get random trivia'),
                onPressed: dispatchRandom,
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    controller.clear();
    final int inputNumber = int.parse(inputStr);
    StoreProvider.of<AppState>(context)
        .dispatch(SearchTriviaAction(inputNumber));
  }

  void dispatchRandom() {
    controller.clear();
    StoreProvider.of<AppState>(context).dispatch(SearchRandomTriviaAction());
  }
}
