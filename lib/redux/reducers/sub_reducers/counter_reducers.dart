import 'package:redux/redux.dart';

import 'package:hello_flutter_redux/redux/actions/counter_actions.dart';

// * Combination of the reducer defined here for export
final Reducer <int> counterReducer = combineReducers<int>([
  _addCounterReducer,
  _decreaseCounterReducer
]);

int _addCounterReducer(int state, action) {
  if(action is AddCounterAction){
    // * Do casting here if needed.
    // ? final addCounterAction = action as AddCounterAction
    // * In this case the action doesn't contain anything
    // * so no need to cast
    return state + 1;
  }
  return state;
}

int _decreaseCounterReducer(int state, action) {
  if(action is DecreaseCounterAction){
    // * Do casting here if needed.
    // ? final decreaseCounterAction = action as Decrease
    // * In this case the action doesn't contain anything
    // * so no need to cast
    return state - 1;
  }
  return state;
}
