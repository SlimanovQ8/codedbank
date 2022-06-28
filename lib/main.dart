import 'package:codedbank/pages/deposit.dart';
import 'package:codedbank/pages/homepage.dart';
import 'package:codedbank/pages/signup.dart';
import 'package:codedbank/pages/test.dart';
import 'package:codedbank/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'pages/signin.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider())
    ],
    child: MyApp(),
  ));
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

  AuthProvider ap = AuthProvider();
  final _router = GoRouter(
    initialLocation: 1==2 ? "/homepage" : "/",
      routes:
  [

    GoRoute(path: "/", builder: (context, state) =>  SignInPage()),
    GoRoute(path: "/deposit", builder: (context, state) => deposit()),
    GoRoute(path: "/signup", builder: (context, state) => SignUpPage()),
    GoRoute(path: "/homepage", builder: (context, state) => HomePage()),
  ]);
}
