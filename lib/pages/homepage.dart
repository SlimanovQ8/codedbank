import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/authProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello ..."),
        
      ),
      drawer:  Drawer(
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, child) => authProvider.isAuth
              ? ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text("Welcome ${authProvider.uuser!.UserName}"),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: const Text("Logout"),
                trailing: const Icon(Icons.logout),
                onTap: () {},
              ),
            ],
          )
              : ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text("Sign in please"),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: const Text("Signin"),
                trailing: const Icon(Icons.login),
                onTap: () {
                  GoRouter.of(context).push('/signin');
                },
              ),
              ListTile(
                title: const Text("Signup"),
                trailing: const Icon(Icons.how_to_reg),
                onTap: () {
                  GoRouter.of(context).push('/signup');
                },
              )
            ],
          ),
        ),
      ),
      
    );
  }
}