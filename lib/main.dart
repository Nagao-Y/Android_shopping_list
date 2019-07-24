import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '買い物かごの合計金額',
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _id;

  static int _thingCounter = 0;
  int _sum = 0;
  int _tax = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('$_thingCounter 合計：$_sum 円(消費税 $_tax ％込)'),
        backgroundColor: Colors.black54,
      ),
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: _thingCounter,
          itemBuilder: (BuildContext context,int index){
            index += 1;
            return new Container(
            child: Row(
              children: [
                    Expanded(
                      flex: 3,
                      child: Text("#$index"),
                    ),

                    //商品名
                    Expanded(
                      flex: 30,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "商品名",
                        ),
                        style: new TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),

                    //単価
                    Expanded(
                      flex: 20,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "単価",
                          hintText: "0",
                        ),
                        style: new TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),

                    //数量
                    Expanded(
                      flex: 10,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "数量",
                          hintText: "0",
                        ),
                        style: new TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
              ],
            ),
          );
          },
        ),
        // child:new ListView(
        //   new List.generate(_thingCounter, (int index){
        //   index += 1;
        //   return new Container(
        //     child: Row(
        //       children: [
        //             Expanded(
        //               flex: 3,
        //               child: Text("#$index"),
        //             ),

        //             //商品名
        //             Expanded(
        //               flex: 30,
        //               child: TextField(
        //                 decoration: InputDecoration(
        //                   labelText: "商品名",
        //                 ),
        //                 style: new TextStyle(
        //                   fontSize: 18.0,
        //                 ),
        //               ),
        //             ),

        //             //単価
        //             Expanded(
        //               flex: 20,
        //               child: TextField(
        //                 keyboardType: TextInputType.number,
        //                 decoration: InputDecoration(
        //                   labelText: "単価",
        //                   hintText: "0",
        //                 ),
        //                 style: new TextStyle(
        //                   fontSize: 18.0,
        //                 ),
        //               ),
        //             ),

        //             //数量
        //             Expanded(
        //               flex: 10,
        //               child: TextField(
        //                 keyboardType: TextInputType.number,
        //                 decoration: InputDecoration(
        //                   labelText: "数量",
        //                   hintText: "0",
        //                 ),
        //                 style: new TextStyle(
        //                   fontSize: 18.0,
        //                 ),
        //               ),
        //             ),
        //       ],
        //     ),
        //   );
        //   },),
        // ),
        onRefresh: _refresh,
      ),
      
      // floatingActionButton: new FloatingActionButton(
      //   onPressed: _createNewList,
      //   child: Text("plus"),
      // ),
    );



  }

    Future<void> _refresh() {
      return Future.sync(() {
        setState(() {
          _thingCounter++;
        });
      });
    }

  _createNewList(){
    setState(() {//この中に変数の処理を書く
      _thingCounter++;
    });
  }

  _changeItemData(int id,String goodsName,int price,int pieces){//数値を反映させる
    setState(() {//この中に変数の処理を書く
    });
  }

}
