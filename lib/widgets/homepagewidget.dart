import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/authProvider.dart';
import 'package:codedbank/services/client.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}
int x = 0;
class IconColors {
  static const Color send = Colors.transparent;
  static const Color transfer = Colors.transparent;
  static const Color passbook = Colors.transparent;
  static const Color more = Colors.transparent;
}

class IconImgs {
  static const String send = "assets/images/send.png";
  static const String transfer = "assets/images/transfer.png";
  static const String passbook = "assets/images/passbook.png";
  static const String freeze = "assets/images/freeze.png";
  static const String unlock = "assets/images/unlock.png";
  static const String secret = "assets/images/secret.png";
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Future <int> getUserInfo(int id) async {
    return  AuthProvider().getAmount(id);

  }
  int b = 0;
  void initState()  {
    super.initState();

    print("initState() called");
  }
  Future <int> getBalance(int id) async {
    Response R = await client.dio.get('/');


    print(R.data[id--]['balance']);
    int amount = R.data[id--]['balance'];
    print("Services{ $amount");
    return amount;
  }
  void gg(int id) async
  {
      int a = await getUserInfo(id);
      setState(() {
        b = a;
        isRefresh = true;
      });

  }
  Future <void> Refresh(int id) async
  {
    gg(id);
  }
  bool isRefresh = false;
  Widget build(BuildContext context) {



    return  Consumer<AuthProvider>(
            builder: (context, authProvider, child) => authProvider.isAuth ?
        RefreshIndicator(
          onRefresh: () async {
            Refresh(authProvider.user!.id!);
          },
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  gg(authProvider.user!.id!);
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.network(authProvider.user!.image!),
                ),
              ),
              Expanded(
                child: (
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
                                          [ Text( isRefresh == true ?
                                            "Balance: $b KD" : "Balance ${authProvider.user!.balance!}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20,
                                                  color: Colors.white,
                                                )),

                                          ]
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                          children:<Widget>
                                          [
                                            SizedBox(
                                              width: 40,
                                              height: 40,
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


                        CustomContainer(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CustomIconButton(
                                circleColor: IconColors.send,
                                buttonImg: "assets/images/deposit3.png",
                                buttonTitle: "Deposit",
                                onTap: () {
                                  context.push("/deposit");

                                },
                              ),
                              CustomIconButton(
                                circleColor: IconColors.transfer,
                                buttonImg: "assets/images/transfer.png",
                                buttonTitle: "TRANSFER",
                                onTap: () {
                                  context.push("/transfer");

                                },
                              ),

                            ],
                          ),
                        ),


                        CustomContainer(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomIconButton(
                                  circleColor: IconColors.passbook,
                                  buttonImg: "assets/images/withdraw.png",
                                  buttonTitle: "Withdraw",
                                  onTap: () {
                                    context.push("/withdraw");

                                  },
                                ),
                                CustomIconButton(
                                  circleColor: IconColors.more,
                                  buttonImg: "assets/images/transactions.png",
                                  buttonTitle: "Transactions",
                                  onTap: () {
                                    context.push("/transaction");

                                  },
                                ),
                              ],
                            )
                        ),
                      ],
                    )

                ),

              ),
            ],
          ),
        ):
            Center(
              child: CircularProgressIndicator(),
        )


    );

  }

}
class CustomContainer extends StatelessWidget {
  final Widget child;
  CustomContainer({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 230,
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(

        color: Color.fromRGBO(45, 64, 89, 1),

        borderRadius: BorderRadius.circular(41),
      ),
      child: child,
    );
  }
}
class CustomIconButton extends StatelessWidget {
  final String buttonTitle, buttonImg;
  final GestureTapCallback onTap;
  final Color circleColor;
  const CustomIconButton({
    required this.circleColor,
    required this.buttonTitle,
    required this.buttonImg,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(

            padding: EdgeInsets.all(0.0),
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(

                  radius: 60,
                  backgroundColor: circleColor,
                  child: Image.asset(
                    buttonImg,
                    height: 59,
                    width: 59,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  buttonTitle,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
