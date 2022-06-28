import 'package:codedbank/widgets/homepagewidget.dart';
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
          builder: (context, authProvider, child) =>
               ListView(
            padding: EdgeInsets.zero,
            children: [
          UserAccountsDrawerHeader(
          accountName: Text("Hi ${authProvider.user!.username}"),
          accountEmail: Text(""),
          decoration: BoxDecoration(color: Color(0xff6894F0)),

          currentAccountPicture: new CircleAvatar(
            radius: 50.0,
            backgroundColor: const Color(0xff28CC61),
            backgroundImage:

            NetworkImage(authProvider.user!.image!) as ImageProvider,
          ),
          ),
              ListTile(
                title: const Text("Profile"),
                trailing: const Icon(Icons.account_box),
                onTap: () {
                  context.push("/profile");
                },
              ),
              ListTile(
                title: const Text("Deposit"),
                trailing: const Icon(Icons.money),
                onTap: () {
                  context.push("/deposit");
                },
              ),
              ListTile(
                title: const Text("Withdraw"),
                trailing: const Icon(Icons.login),
                onTap: () {
                  context.push("/");
                },
              ),
              ListTile(
                title: const Text("Transfer"),
                trailing: const Icon(Icons.login),
                onTap: () {
                  context.push("/");
                },
              ),
              ListTile(
                title: const Text("Logout"),
                trailing: const Icon(Icons.logout),
                onTap: () {
                  Provider.of<AuthProvider>(context, listen: false).logout();

                  context.push("/");

                },
              ),
            ],
          )

        ),
      ),
      body:  HomePageWidget(),

      );

  }
}
