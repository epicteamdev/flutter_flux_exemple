import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'app_reducer.dart';
import 'app_state.dart';
import '../middlewares/navigation/nagivation_middleware.dart';

Store<AppState> createAppStore() {
  return Store(appReducer, initialState: AppState.inital(), middleware: [
    thunkMiddleware,
    NavigationMiddleware(),
  ]);
}
