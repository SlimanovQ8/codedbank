import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ListView1 ({ required List trasactions}) {

  return  ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
      itemCount: trasactions.length,
      itemBuilder: (context, int i) {


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
                  "Amount: ${trasactions[i].amount} kd",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {

                },
              ),
            ),
          ),
        );
      });
}