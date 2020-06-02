import 'package:flutter/material.dart';

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
class QuickMsg extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
       backgroundColor:Colors.teal[200],
       appBar: AppBar(title:Text('Quick message')),
       
    );
  }

}
class ScheduleMsg extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
       backgroundColor:Colors.teal[200],
       appBar: AppBar(title:Text('schedule msg')),

    );
  }

}

