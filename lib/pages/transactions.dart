import 'package:codedbank/widgets/ListViewWidgets.dart';
import 'package:codedbank/widgets/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/transactions.dart';
import '../providers/authProvider.dart';
class transactions extends StatefulWidget {
  const transactions({Key? key}) : super(key: key);

  @override
  _transactionsState createState() => _transactionsState();
}
var trasactions = AuthProvider().transctions.toList();

class _transactionsState extends State<transactions> {

  bool isEmpty = true;
  String searchAll = "";
  int index = 0;

  @override
  MakeEmpty()
  {
    setState(() {
      searchAll = "";
      isEmpty = true;
    });
  }
    ChangeList()
  {

    setState(() {
      if(index == 0)
        {
          searchAll.isEmpty ?
          trasactions = context.read<AuthProvider>().transctions.toList()
              :
          trasactions = context.read<AuthProvider>().transctions.where((element) => element.amount == int.parse(searchAll)).toList();


      }

      else if(index == 1)
        {
          searchAll.isEmpty ?
          trasactions = context.read<AuthProvider>().transctions.where((element) => element.type == "deposit").toList()
              :
          trasactions = context.read<AuthProvider>().transctions.where((element) => element.amount == int.parse(searchAll) && element.type == "deposit").toList();

        }

      else if(index == 2)
      {

        searchAll.isEmpty ?
        trasactions = context.read<AuthProvider>().transctions.where((element) => element.type == "transfer").toList()
            :
        trasactions = context.read<AuthProvider>().transctions.where((element) => element.amount == int.parse(searchAll) && element.type == "transfer").toList();
      }

      else if(index == 3)
      {
        searchAll.isEmpty ?
        trasactions = context.read<AuthProvider>().transctions.where((element) => element.type == "withdraw").toList()
            :
        trasactions = context.read<AuthProvider>().transctions.where((element) => element.amount == int.parse(searchAll) && element.type == "withdraw").toList();

      }

      isEmpty = false;
    }) ;
  }
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
              print(i);

              setState(() {
                index = i;
                ChangeList();
              });
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
                   if(isEmpty) {
                     trasactions = context
                         .read<AuthProvider>()
                         .transctions
                         .toList();
                   }
                   //ChangeList();
                 return Consumer<AuthProvider>(
                 builder:  (context, value, child) =>

                     Column(

                       children: [
                         TextFieldForms().SearchTextField(
                           context: context,
                           searchAll: searchAll,
                           OnChanged: (value) {
                           searchAll = value;
                           if(searchAll.isEmpty)
                             {
                               MakeEmpty();
                             }
                           },
                             isEmpty: isEmpty,
                             onTap: ChangeList,
                             onPressed: MakeEmpty,
                             trasactions: trasactions,
                         ),
                         Expanded(
                           child: trasactions.isEmpty ? Center(
                               child: Text("There are no transactions ", style: TextStyle(
                                   fontSize: 18,
                                   color:  Colors.white
                               ),)
                           ) :  ListView1(trasactions: trasactions)
                         ),
                       ],
                     )


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
                if(isEmpty || searchAll.isEmpty) trasactions = context.read<AuthProvider>().transctions.where((element) => element.type == "deposit").toList();

                else 
                  trasactions = 
                      context.read<AuthProvider>().
                      transctions.where((element) => element.type == "deposit" && element.amount == int.parse(searchAll)).toList();

                return Column(
                  children: [
                    TextFieldForms().SearchTextField(
                      context: context,
                      searchAll: searchAll,
                      OnChanged:
                          (value) {
                        searchAll = value;
                        if(searchAll.isEmpty)
                        {
                          MakeEmpty();
                        }
                      },
                      isEmpty: isEmpty,
                      onTap: ChangeList,
                      onPressed: MakeEmpty,
                      trasactions: trasactions,
                    ),

                    Expanded(
                      child:
                      trasactions.isEmpty ? Center(
                          child: Text("There are no transactions ", style: TextStyle(
                            fontSize: 18,
                            color:  Colors.white
                          ),)
                      ) : Consumer<AuthProvider>(
                          builder:  (context, value, child) =>
                              ListView1(trasactions: trasactions)


                      ),
                    ),
                  ],
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
                     if(isEmpty || searchAll.isEmpty) trasactions = context.read<AuthProvider>().transctions.where((element) => element.type == "transfer").toList();

                     else
                       trasactions =
                           context.read<AuthProvider>().
                           transctions.where((element) => element.type == "transfer" && element.amount == int.parse(searchAll)).toList();

                     return Column(
                       children: [
                         TextFieldForms().SearchTextField(context: context,
                           searchAll: searchAll,
                           OnChanged:
                               (value) {
                             searchAll = value;
                             if(searchAll.isEmpty)
                             {
                               MakeEmpty();
                             }
                           },


                           isEmpty: isEmpty,
                           onTap: ChangeList,
                           onPressed: MakeEmpty,
                           trasactions: trasactions,
                         ),

                         Expanded(
                           child:
                           trasactions.isEmpty ? Center(
                               child: Text("There are no transactions ", style: TextStyle(
                                   fontSize: 18,
                                   color:  Colors.white
                               ),)
                           ) :Consumer<AuthProvider>(
                               builder:  (context, value, child) =>
                                   ListView1(trasactions: trasactions)


                           ),
                         ),
                       ],
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
                     if(isEmpty || searchAll.isEmpty) trasactions = context.read<AuthProvider>().transctions.where((element) => element.type == "withdraw").toList();

                     else
                       trasactions =
                           context.read<AuthProvider>().
                           transctions.where((element) => element.type == "withdraw" && element.amount == int.parse(searchAll)).toList();

                     return Column(
                       children: [
                         TextFieldForms().SearchTextField(context: context,
                           searchAll: searchAll,
                           OnChanged:
                               (value) {
                             searchAll = value;
                             if(searchAll.isEmpty)
                             {
                               MakeEmpty();
                             }
                           },


                           isEmpty: isEmpty,
                           onTap: ChangeList,
                           onPressed: MakeEmpty,
                           trasactions: trasactions,
                         ),

                         Expanded(
                           child:
                           trasactions.isEmpty ? Center(
                               child: Text("There are no transfers ", style: TextStyle(
                                   fontSize: 18,
                                   color:  Colors.white
                               ),)
                           ) :Consumer<AuthProvider>(
                               builder:  (context, value, child) =>
                                  ListView1(trasactions: trasactions)


                           ),
                         ),
                       ],
                     );


                   }}),
           ],
         ),
      ),
    );
  }
}
