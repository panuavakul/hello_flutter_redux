import 'package:flutter/foundation.dart';

class AppState {
  // * Constructor
  AppState({
    @required this.count
  });

  // * Class Parameters
  final int count;

  // * InitialState
  AppState.initialState()
  : count = 0;

  // Above is bascially the same as
  // * AppState initialState() {
  // *   return AppState(
  // *     count: 0
  // *   );
  // * }
  //
}