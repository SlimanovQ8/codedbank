import 'package:flutter/material.dart';

void main() => runApp(test());

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height:400,
                    child: Flexible(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
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
                                          Text(" 1000 KD",
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
            ]),
                    )
                  ),
                  Container(
                    height: 200,
                    child: GridView.builder(
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
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}