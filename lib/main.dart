import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '消費税込み計算',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  final myController = TextEditingController();
  

  List<Map<String,dynamic>> itmes =[
    {"key" : 0 ,"comment" : "商品名" , "price" : 100 , "piece" : 5}
  ];
  static int _counter = 1;

  int _sum = 0;
  int _tax = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
              key: _key,
      appBar: AppBar(
        title: Text('合計：$_sum 円(消費税 $_tax ％込)'),
        backgroundColor: Colors.black54,
      ),

      body: Container(
        child: Column(
          children: <Widget>[

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: itmes.length,
                itemBuilder: (BuildContext context , int index){
                  final item = itmes[index];

                  return new Card(                    
                    child: ListTile(                      
                      title: Text(
                        item["key"].toString() + ": メモ" + item["comment"].toString() 
                        + "単価" + item["price"].toString() + "数量" + item["piece"].toString()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

      // body: RefreshIndicator(
      //   child: ListView.builder(
      //     itemCount: _thingCounter,
      //     itemBuilder: (BuildContext context,int index){
      //       index += 1;
      //       return new Container(
      //         child: Row(
      //           children: [
      //                 Expanded(
      //                   flex: 3,
      //                   child: Text("#$index"),
      //                 ),

      //                 //商品名
      //                 Expanded(
      //                   flex: 30,
      //                   child: TextField(
      //                     decoration: InputDecoration(
      //                       labelText: "商品名",
      //                     ),
      //                     style: new TextStyle(
      //                       fontSize: 18.0,
      //                     ),        
      //                   ),
      //                 ),

      //                 //単価
      //                 Expanded(
      //                   flex: 20,
      //                   child: TextField(
      //                     keyboardType: TextInputType.number,
      //                     decoration: InputDecoration(
      //                       labelText: "単価",
      //                       hintText: "0",
      //                     ),
      //                     style: new TextStyle(
      //                       fontSize: 18.0,
      //                     ),
      //                     onChanged: _changeItemData(myController.text),
      //                   ),
      //                 ),

      //                 //数量
      //                 Expanded(
      //                   flex: 10,
      //                   child: TextField(
      //                     keyboardType: TextInputType.number,
      //                     decoration: InputDecoration(
      //                       labelText: "数量",
      //                       hintText: "0",
      //                     ),
      //                     style: new TextStyle(
      //                       fontSize: 18.0,
      //                     ),
      //                   ),
      //                 ),
                  
      //           ],              
      //         ),
      //       );
      //     },
      //   ),
      //   onRefresh: _refresh,
      // ),
  //   );
  // }

  // Future<void> _refresh() {
  //   return Future.sync(() {
  //     setState(() {
  //       _thingCounter++;
  //     });
  //   });
  // }

  // _changeItemData(String price){//数値を反映させる
  //   if(price == ""){

  //   }else{
  //     setState(() {//この中に変数の処理を書く
  //         _sum += int.parse(price);
  //     });
  //   }

  //}

//}
