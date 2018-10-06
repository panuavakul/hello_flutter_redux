import 'package:redux/redux.dart';

import 'package:hello_flutter_redux/redux/states/app_states.dart';
export 'package:hello_flutter_redux/redux/states/app_states.dart';

import 'package:hello_flutter_redux/redux/reducers/app_reducer.dart';

final Store store = Store<AppState>(
  appReducer,
  initialState: AppState.initialState()
);
