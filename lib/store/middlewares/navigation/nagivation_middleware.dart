import 'package:redux/redux.dart';

import '../../../keys.dart';
import '../../../store/app_state.dart';
import 'nagivation_actions.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    print(action);
    final currentState = Keys.navigationKey.currentState;
    if (action is NavigateTo && currentState != null) {
      currentState.pushNamed(action.routeName);
    } else if (action is NavigateBack && currentState != null) {
      currentState.pop();
    }
    next(action);
  }
}
