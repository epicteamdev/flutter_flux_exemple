import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:url_strategy/url_strategy.dart';

import 'keys.dart';
import 'pages/pages.dart' as pages;
import 'store/app_state.dart';
import 'store/app_store.dart' show createAppStore;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text(snapshot.error.toString()),
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return FlutterFluxExemple();
        }
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

class FlutterFluxExemple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: createAppStore(),
      child: MaterialApp(
        navigatorKey: Keys.navigationKey,
        initialRoute: "/",
        routes: {
          "/": (context) {
            return pages.MyNotes();
          },
          "/add_note": (context) {
            return pages.AddNote();
          }
        },
      ),
    );
  }
}
