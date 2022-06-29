import 'package:codedbank/widgets/homepagewidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/authProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 64, 89, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(240, 123, 63, 1)),
        backgroundColor: Color.fromRGBO(45, 64, 89, 1),
        title: Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: Text(
            "My Account",
            style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(45, 64, 89, 1),
        child: Consumer<AuthProvider>(
            builder: (context, authProvider, child) => ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text(
                          " Welcome ${authProvider.user!.username}"
                              .toUpperCase(),
                          style: TextStyle(color: Colors.black)),
                      accountEmail: Text(""),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(234, 84, 85, 1),
                            Color.fromRGBO(255, 212, 96, 1)
                          ],
                        ),
                      ),
                      currentAccountPicture: new CircleAvatar(
                        radius: 50.0,
                        // backgroundColor: const Color(0xff28CC61),
                        backgroundImage: NetworkImage(authProvider.user!.image!)
                            as ImageProvider,
                      ),
                    ),
                    ListTile(
                      title: const Text("Profile",
                          style: TextStyle(
                              color: Color.fromRGBO(240, 123, 63, 1))),
                      trailing: const Icon(Icons.account_box,
                          color: Color.fromRGBO(240, 123, 63, 1)),
                      onTap: () {
                        context.go("/homepage");
                      },
                    ),
                    ListTile(
                      title: const Text("Deposit",
                          style: TextStyle(
                              color: Color.fromRGBO(240, 123, 63, 1))),
                      trailing: const Icon(Icons.add_card,
                          color: Color.fromRGBO(240, 123, 63, 1)),
                      onTap: () {
                        context.push("/deposit");
                      },
                    ),
                    ListTile(
                      title: const Text("Withdraw",
                          style: TextStyle(
                              color: Color.fromRGBO(240, 123, 63, 1))),
                      trailing: const Icon(Icons.login,
                          color: Color.fromRGBO(240, 123, 63, 1)),
                      onTap: () {
                        context.push("/");
                      },
                    ),
                    ListTile(
                      title: const Text("Transfer",
                          style: TextStyle(
                              color: Color.fromRGBO(240, 123, 63, 1))),
                      trailing: const Icon(Icons.change_circle_outlined,
                          color: Color.fromRGBO(240, 123, 63, 1)),
                      onTap: () {
                        context.push("/");
                      },
                    ),
                    ListTile(
                      title: const Text("Logout",
                          style: TextStyle(
                              color: Color.fromRGBO(240, 123, 63, 1))),
                      trailing: const Icon(Icons.logout,
                          color: Color.fromRGBO(240, 123, 63, 1)),
                      onTap: () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .logout();

                        context.go("/");
                      },
                    ),
                  ],
                )),
      ),
      body: HomePageWidget(),
    );
  }
}
