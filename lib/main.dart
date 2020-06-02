import 'package:flutter/material.dart';

import 'ChatHelper.dart';
import 'ChatItemModel.dart';
import 'package:dash_chat/dash_chat.dart';



void main() {
  runApp(
    MyApp()
    
  );
  
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
    
      
      home: BaseApp(),debugShowCheckedModeBanner: false,
      
      routes: <String, WidgetBuilder> {
        "/QuickOrders" :(context)=>QuickOrders(),
         "/QuickMsg" :(context)=>QuickMsg(),
         "/ScheduleMsg" :(context)=>ScheduleMsg(),
         "/MsgView" :(context)=>MsgView(),
      }

     );   
    
  }
}
class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
   return Scaffold(
        backgroundColor: Colors.teal[200],
        body: Center(
          child: Column(
            
        
      children: <Widget>[
        
         const SizedBox(height: 150),
        RaisedButton(
          onPressed: () {},
          child: const Text(
            'Login',
            style: TextStyle(fontSize: 20)
          ),
        ),
        
        const SizedBox(height: 50),
        RaisedButton(
          onPressed: () {},
          child: const Text(
            'Sign Up',
            style: TextStyle(fontSize: 20)
          ),
        ),
        SizedBox(height:70),
        Container(
              width: 80,
              height: 80,
              child: MaterialButton(
                shape: CircleBorder(side: BorderSide(width: 3, color: Colors.red, style: BorderStyle.solid)),
                child: Text("Quick Orders"),
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context, "/QuickOrders");
                },
              ),
            ),
      
      ],
    ),
          ),
        
      );
  }
}
class QuickOrders extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.teal[200],
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(width: 10,height: 100,),
          FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.red)),
      color: Colors.white,
      textColor: Colors.red,
      padding: EdgeInsets.all(8.0),
      onPressed: () {
         Navigator.pushNamed(context, "/QuickMsg");
      },
      child: Text(
        "Quick Order".toUpperCase(),
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
    ),
    SizedBox(width: 10,height: 50,),
    RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.red)),
      onPressed: () {
         Navigator.pushNamed(context, "/ScheduleMsg");
      },
      color: Colors.red,
      textColor: Colors.white,
      child: Text("Schedule Delivery".toUpperCase(),
        style: TextStyle(fontSize: 14)),
    ),
     SizedBox(width: 10,height: 50,),
    Container(
              width: 80,
              height: 80,
              child: MaterialButton(
                shape: CircleBorder(side: BorderSide(width: 3, color: Colors.red, style: BorderStyle.solid)),
                child: Text("My Order"),
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: (){
                 
                },
              ),
            ),
             SizedBox(width: 10,height: 50,),
            Container(
              width: 80,
              height: 80,
              child: MaterialButton(
                shape: CircleBorder(side: BorderSide(width: 3, color: Colors.red, style: BorderStyle.solid)),
                child: Text("Support"),
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: (){
                  
                },
              ),
            ),
        ],
      ),
    );
  }
}
class QuickMsg extends StatefulWidget {
  @override
  _QuickMsgState createState() => new _QuickMsgState();
}


class _QuickMsgState extends State<QuickMsg>
    with SingleTickerProviderStateMixin {
  Color whatsAppGreen = Color.fromRGBO(18, 140, 126, 1.0);
  Color whatsAppGreenLight = Color.fromRGBO(37, 211, 102, 1.0);

  TabController tabController;
  var fabIcon = Icons.message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(vsync: this, length: 1)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              break;
            case 1:
              fabIcon = Icons.message;
              break;
           
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "quickmsg",
          style: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        backgroundColor: whatsAppGreen,
        bottom: TabBar(
          tabs: [
            
            Tab(
              child: Text("CHATS"),
            ),
            
          ],
          indicatorColor: Colors.white,
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
         
          ListView.builder(
            itemBuilder: (context, position) {
             
              ChatItemModel chatItem = ChatHelper.getChatItem(position);
             
              return Column(
                children: <Widget>[
                   
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          size: 64.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      chatItem.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      chatItem.messageDate,
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    chatItem.mostRecentMessage,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  Divider(),
                ],
              );
            },
            itemCount: ChatHelper.itemCount,
            
            
          ),
        ],
      ),
    );
  }
}
class ScheduleMsg extends StatefulWidget {
  @override
  _ScheduleMsgState createState() => new _ScheduleMsgState();
}


class _ScheduleMsgState extends State<ScheduleMsg>
    with SingleTickerProviderStateMixin {
  Color whatsAppGreen = Color.fromRGBO(18, 140, 126, 1.0);
  Color whatsAppGreenLight = Color.fromRGBO(37, 211, 102, 1.0);

  TabController tabController;
  var fabIcon = Icons.message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(vsync: this, length: 1)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              break;
            case 1:
              fabIcon = Icons.message;
              break;
           
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "schedulemsg",
          style: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        backgroundColor: whatsAppGreen,
        bottom: TabBar(
          tabs: [
            
            Tab(
              child: Text("CHATS"),
              
            ),
            
            
          ],
          indicatorColor: Colors.white,
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
        
          ListView.builder(
            itemBuilder: (context, position) {
              ChatItemModel chatItem = ChatHelper.getChatItem(position);

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          size: 64.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      chatItem.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      chatItem.messageDate,
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    chatItem.mostRecentMessage,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: ChatHelper.itemCount,
          ),
        ],
      ),
    );
  }
}
class MsgView extends StatelessWidget{
 @override
 Widget build(BuildContext context){
   return Scaffold(
     backgroundColor:Colors.teal[300],
    

   );
}
}