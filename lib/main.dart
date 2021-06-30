import 'package:clean_architecture_demo/middleware/network_trivia_middleware.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_demo/redux_app.dart';
import 'package:redux/redux.dart';
import 'package:clean_architecture_demo/models/models.dart';
import 'package:clean_architecture_demo/reducers/app_state_reducer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/data/datasources/number_trivia_local_data_source.dart';
import 'core/data/datasources/number_trivia_remote_data_source.dart';
import 'core/data/repositories/number_trivia_repository_impl.dart';
import 'core/network/network_info.dart';
import 'package:clean_architecture_demo/models/state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final remoteDataSource =
      NumberTriviaRemoteDataSourceImpl(client: http.Client());
  final localDataSource =
      NumberTriviaLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  final networkInfo = NetworkInfoImpl(DataConnectionChecker());

  runApp(ReduxApp(
    store: Store<AppState>(
      appReducer,
      initialState: AppState.loading(),
      middleware: createNetworkTriviaMiddleware(
        NumberTriviaRepositoryImpl(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource,
            networkInfo: networkInfo),
      ),
    ),
  ));
}
