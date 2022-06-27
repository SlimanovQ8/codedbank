import 'package:codedbank/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/signin.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,

    );
  }
  final _router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => SignInPage()),
    GoRoute(path: "/signup", builder: (context, state) => SignUpPage()),
   
  ]);
}
