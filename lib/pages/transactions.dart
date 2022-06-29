import 'package:flutter/material.dart';
class transactions extends StatefulWidget {
  const transactions({Key? key}) : super(key: key);

  @override
  _transactionsState createState() => _transactionsState();
}

class _transactionsState extends State<transactions> {
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
             ListView.separated(
             separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
        itemCount: 3,
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
                    color: Color.fromRGBO(240, 123, 63, 1)
                ),
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.update,
                              color: green == true
                                  ? Colors.green
                                  : orange == true
                                  ? Colors.orange
                                  : Colors.red,
                              size: 40.0),
                          onPressed: () {}
                           ),
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
                      Icons.send,
                      size: 35,
                    ),
                  ),
                  title: Text(
                    "ftg",
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
        }),
             Center(child: Text("2"),),
             Center(child: Text("3"),),
             Center(child: Text("3"),),
           ],
         ),
      ),
    );
  }
}
