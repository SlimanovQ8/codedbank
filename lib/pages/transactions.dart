import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/transactions.dart';
import '../providers/authProvider.dart';
class transactions extends StatefulWidget {
  const transactions({Key? key}) : super(key: key);

  @override
  _transactionsState createState() => _transactionsState();
}
Future <List<Transctions>> getTransactions(int index) async {
   List <Transctions> t = [];
  if (index == 1)
    {
      t = AuthProvider().transctions.where((element) => element.type == "deposit").toList();

    }

   else if (index == 2)
   {
     t = AuthProvider().transctions.where((element) => element.type == "transfer").toList();

   }
   if (index == 3)
   {
     t = AuthProvider().transctions.where((element) => element.type == "withdraw").toList();

   }
   return t;
}
class _transactionsState extends State<transactions> {

  String filter = "all";

  @override
  Widget build(BuildContext context) {



    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(45, 64, 89, 1),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromRGBO(240, 123, 63, 1)),
          backgroundColor: Color.fromRGBO(45, 64, 89, 1),
          title: Padding(
            padding: const EdgeInsets.only(left: 70.0),
            child: Text(
              "Transactions",
              style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
            ),
          ),
          bottom: TabBar(
            onTap: (i){

            },
            tabs: [
              Tab(text: "All",),
              Tab(text: "Deposit",),
              Tab(text: "Transfer",),
              Tab(text: "Withdraw",),
            ],
          ),
        ),
         body: TabBarView(
           children: [
             FutureBuilder(
               future:  Provider.of<AuthProvider>(context, listen: false).getTranscations(),

                 builder: (context, snapShot)
                 {
                 if (snapShot.connectionState == ConnectionState.waiting) {
                 return const Center(
                 child: CircularProgressIndicator(),
                 );
                 }
                 else
                 {

                   // if(filter != "all"){
                   //   transactions =
                   // }
                 return Consumer<AuthProvider>(
                 builder:  (context, value, child) =>
                     ListView.separated(
                         separatorBuilder: (context, index) => Divider(
                           color: Colors.black,
                         ),
                         itemCount: value.transctions.length,
                         itemBuilder: (context, int i) {
                           final now = new DateTime.now();


                           bool red = false;
                           bool orange = false;
                           bool green = false;

                           return Padding(
                             padding: EdgeInsets.symmetric(
                                 vertical: 0.0, horizontal: 20.0),
                             child: Card(
                               elevation: 8.0,
                               margin: new EdgeInsets.symmetric(
                                   horizontal: 10.0, vertical: 6.0),
                               child: Container(
                                 height: 80,
                                 decoration: BoxDecoration(
                                     color: value.transctions[i].type == "deposit" ? Colors.green : value.transctions[i].type == "withdraw" ? Colors.red : Color.fromRGBO(240, 123, 63, 1)
                                 ),
                                 child: ListTile(
                                   trailing: Row(
                                     mainAxisSize: MainAxisSize.min,
                                     children: <Widget>[
                                       /*IconButton(
                                           icon: Icon(Icons.update,
                                               color: green == true
                                                   ? Colors.green
                                                   : orange == true
                                                   ? Colors.orange
                                                   : Colors.red,
                                               size: 40.0),
                                           onPressed: () {}
                                       ),*/
                                     ],
                                   ),
                                   leading: Container(
                                     padding: EdgeInsets.only(right: 12.0),
                                     decoration: new BoxDecoration(
                                         border: new Border(
                                             right: new BorderSide(
                                                 width: 1.0,
                                                 color: Colors.black))),
                                     child: Icon(
                                       value.transctions[i].type == "deposit" ? Icons.call_received : value.transctions[i].type == "withdraw"  ? Icons.call_made : Icons.change_circle,


                                       size: 35,
                                     ),
                                   ),
                                   title: Text(
                                     value.transctions[i].type,
                                     style: TextStyle(color: Colors.black),
                                   ),
                                   subtitle: Text(
                                     "t",
                                     style: TextStyle(color: Colors.black),
                                   ),
                                   onTap: () {

                                   },
                                 ),
                               ),
                             ),
                           );
                         })


                 );


                 }}),


        FutureBuilder(
            future:  Provider.of<AuthProvider>(context, listen: false).getTranscations(),

            builder: (context, snapShot)
            {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              else
              {
                var trasactions = context.read<AuthProvider>().transctions.where((element) => element.type == "deposit").toList();

                return Consumer<AuthProvider>(
                    builder:  (context, value, child) =>
                        ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.black,
                            ),
                            itemCount: trasactions.length,
                            itemBuilder: (context, int i) {
                              final now = new DateTime.now();


                              bool red = false;
                              bool orange = false;
                              bool green = false;

                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 20.0),
                                child: Card(
                                  elevation: 8.0,
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 6.0),
                                  child: Container(
                                    height: 80,
                                    decoration: BoxDecoration(
                                        color: trasactions[i].type == "deposit" ? Colors.green : trasactions[i].type == "withdraw" ? Colors.red : Color.fromRGBO(240, 123, 63, 1)
                                    ),
                                    child: ListTile(
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          /*IconButton(
                                           icon: Icon(Icons.update,
                                               color: green == true
                                                   ? Colors.green
                                                   : orange == true
                                                   ? Colors.orange
                                                   : Colors.red,
                                               size: 40.0),
                                           onPressed: () {}
                                       ),*/
                                        ],
                                      ),
                                      leading: Container(
                                        padding: EdgeInsets.only(right: 12.0),
                                        decoration: new BoxDecoration(
                                            border: new Border(
                                                right: new BorderSide(
                                                    width: 1.0,
                                                    color: Colors.black))),
                                        child: Icon(
                                          trasactions[i].type == "deposit" ? Icons.call_received : trasactions[i].type == "withdraw"  ? Icons.call_made : Icons.change_circle,

                                          size: 35,
                                        ),
                                      ),
                                      title: Text(
                                        trasactions[i].type,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        "t",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onTap: () {

                                      },
                                    ),
                                  ),
                                ),
                              );
                            })


                );


              }}),
             FutureBuilder(
                 future:  Provider.of<AuthProvider>(context, listen: false).getTranscations(),

                 builder: (context, AsyncSnapshot snapshot)
                 {
                   if (snapshot.connectionState == ConnectionState.waiting) {
                     return const Center(
                       child: CircularProgressIndicator(),
                     );
                   }
                   else
                   {
                     var trasactions = context.read<AuthProvider>().transctions.where((element) => element.type == "transfer").toList();

                     return Consumer<AuthProvider>(
                         builder:  (context, value, child) =>
                             ListView.separated(
                                 separatorBuilder: (context, index) => Divider(
                                   color: Colors.black,
                                 ),
                                 itemCount:  trasactions.length ,
                                 itemBuilder: (context, int i) {
                                   final now = new DateTime.now();


                                   bool red = false;
                                   bool orange = false;
                                   bool green = false;

                                   return Padding(
                                     padding: EdgeInsets.symmetric(
                                         vertical: 0.0, horizontal: 20.0),
                                     child: Card(
                                       elevation: 8.0,
                                       margin: new EdgeInsets.symmetric(
                                           horizontal: 10.0, vertical: 6.0),
                                       child: Container(
                                         height: 80,
                                         decoration: BoxDecoration(
                                             color: trasactions[i].type == "deposit" ? Colors.green : trasactions[i].type == "withdraw" ? Colors.red : Color.fromRGBO(240, 123, 63, 1)
                                         ),
                                         child: ListTile(
                                           trailing: Row(
                                             mainAxisSize: MainAxisSize.min,
                                             children: <Widget>[
                                               /*IconButton(
                                           icon: Icon(Icons.update,
                                               color: green == true
                                                   ? Colors.green
                                                   : orange == true
                                                   ? Colors.orange
                                                   : Colors.red,
                                               size: 40.0),
                                           onPressed: () {}
                                       ),*/
                                             ],
                                           ),
                                           leading: Container(
                                             padding: EdgeInsets.only(right: 12.0),
                                             decoration: new BoxDecoration(
                                                 border: new Border(
                                                     right: new BorderSide(
                                                         width: 1.0,
                                                         color: Colors.black))),
                                             child: Icon(
                                               trasactions[i].type == "deposit" ? Icons.call_received : trasactions[i].type == "withdraw"  ? Icons.call_made : Icons.change_circle,

                                               size: 35,
                                             ),
                                           ),
                                           title: Text(
                                             trasactions[i].type,
                                             style: TextStyle(color: Colors.black),
                                           ),
                                           subtitle: Text(
                                             "t",
                                             style: TextStyle(color: Colors.black),
                                           ),
                                           onTap: () {

                                           },
                                         ),
                                       ),
                                     ),
                                   );
                                 })


                     );


                   }}),
             FutureBuilder(
                 future:  Provider.of<AuthProvider>(context, listen: false).getTranscations(),

                 builder: (context, snapShot)
                 {
                   if (snapShot.connectionState == ConnectionState.waiting) {
                     return const Center(
                       child: CircularProgressIndicator(),
                     );
                   }
                   else
                   {
                     var trasactions = context.read<AuthProvider>().transctions.where((element) => element.type == "withdraw").toList();

                     return Consumer<AuthProvider>(
                         builder:  (context, value, child) =>
                             ListView.separated(
                                 separatorBuilder: (context, index) => Divider(
                                   color: Colors.black,
                                 ),
                                 itemCount: trasactions.length,
                                 itemBuilder: (context, int i) {
                                   final now = new DateTime.now();


                                   bool red = false;
                                   bool orange = false;
                                   bool green = false;

                                   return Padding(
                                     padding: EdgeInsets.symmetric(
                                         vertical: 0.0, horizontal: 20.0),
                                     child: Card(
                                       elevation: 8.0,
                                       margin: new EdgeInsets.symmetric(
                                           horizontal: 10.0, vertical: 6.0),
                                       child: Container(
                                         height: 80,
                                         decoration: BoxDecoration(
                                             color: trasactions[i].type == "deposit" ? Colors.green : trasactions[i].type == "withdraw" ? Colors.red : Color.fromRGBO(240, 123, 63, 1)
                                         ),
                                         child: ListTile(
                                           trailing: Row(
                                             mainAxisSize: MainAxisSize.min,
                                             children: <Widget>[
                                               /*IconButton(
                                           icon: Icon(Icons.update,
                                               color: green == true
                                                   ? Colors.green
                                                   : orange == true
                                                   ? Colors.orange
                                                   : Colors.red,
                                               size: 40.0),
                                           onPressed: () {}
                                       ),*/
                                             ],
                                           ),
                                           leading: Container(
                                             padding: EdgeInsets.only(right: 12.0),
                                             decoration: new BoxDecoration(
                                                 border: new Border(
                                                     right: new BorderSide(
                                                         width: 1.0,
                                                         color: Colors.black))),
                                             child: Icon(
                                               trasactions[i].type == "deposit" ? Icons.call_received : trasactions[i].type == "withdraw"  ? Icons.call_made : Icons.change_circle,

                                               size: 35,
                                             ),
                                           ),
                                           title: Text(
                                             trasactions[i].type,
                                             style: TextStyle(color: Colors.black),
                                           ),
                                           subtitle: Text(
                                             "t",
                                             style: TextStyle(color: Colors.black),
                                           ),
                                           onTap: () {

                                           },
                                         ),
                                       ),
                                     ),
                                   );
                                 })


                     );


                   }}),
           ],
         ),
      ),
    );
  }
}
