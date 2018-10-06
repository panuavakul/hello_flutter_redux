import 'package:redux/redux.dart';

import 'package:hello_flutter_redux/redux/states/app_states.dart';
import './sub_reducers.dart';

// * The main reducer of the app
AppState appReducer(AppState state, action) {
  // This must return a new AppState everytime
  return AppState(
    // Have counterReducer calculate the new counter and make a new app state
    count: counterReducer(state.count, action)
  );
}