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
                  context.push("/");
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
      body:  Consumer<AuthProvider>(
      builder: (context, authProvider, child) => authProvider.isAuth ?
    (
        ListView(
                children: [
                  Card(

                    color: Color(0xff343b4b),

                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 10,
                    margin: EdgeInsets.all(7),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading:
                          ImageIcon(
                            AssetImage("assets/images/codedlogo.png"),

                            size: 80,
                            color: Colors.white,
                          ),
                          title: Text("Card Number 4200",



                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                          //      subtitle: ,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                            //border: Border.all(color: Colors.black,width: 0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.all(12.5),
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 40,
                              ),
                              Expanded(
                                child: Column(
                                    children:<Widget>
                                    [ Text("Total balance",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 15,
                                            color: Colors.white,
                                          )),
                                      Row(
                                          children:<Widget> [
                                            SizedBox(
                                              width: 25,
                                            ),
                                            Text("${authProvider.user!.balance}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 14,
                                                  color: Colors.white,
                                                )),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            GestureDetector(child: Icon(Icons.info_outline), onTap: (){
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) =>
                                                      AlertDialog(
                                                        backgroundColor: Color (0xff343b4b),
                                                        title: Text("total balance", style: TextStyle(

                                                            color: Color(0xff5496F4)
                                                        ),),
                                                        content: Text("Total balance without applying the saving rules", style: TextStyle(

                                                            color: Color(0xff5496F4)
                                                        ),),
                                                        actions: [

                                                          TextButton(onPressed: () {
                                                            Navigator.pop(context);
                                                          },

                                                            child: Text("OK", style: TextStyle(
                                                                color: Colors.red
                                                            ),),
                                                          ),
                                                        ],
                                                      )
                                              );
                                            },)


                                          ]
                                      ),
                                    ]
                                ),
                              ),
                              Expanded(
                                child: Column(
                                    children:<Widget>
                                    [ Text("Available balance",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 15,
                                            color: Colors.white,
                                          )),
                                      SizedBox(
                                        width: 40,
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
  /*     GridView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: 3,
              itemBuilder: (ctx, i) =>
                 Center(
                   child: GridTile(
                     child: RaisedButton(
                       onPressed: ()
                       {
                         print("s");
                       },
                       color: Color(0xfffffafa),
                       child: Image.asset("assets/images/codedlogo.png", height: 120,)),


                   ),
                 ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery
                    .of(context)
                    .size
                    .width /
                    (MediaQuery
                        .of(context)
                        .size
                        .height / 1.6),
                crossAxisSpacing: 25,
                mainAxisSpacing: 12.5,
              ),
*/        //)
                ],
        )              ): Center(
        child: CircularProgressIndicator(),
      )

      ),

    );
  }
}
