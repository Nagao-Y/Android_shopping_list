import 'package:flutter/cupertino.dart';
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
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //int _id;

  List<Map<String,dynamic>> listItems = [
    {"id":1, "goods":"goods1","price":"100","pieces":"0"},
    {"id":2, "goods":"goods2","price":"100","pieces":"0"},
    {"id":3, "goods":"goods3","price":"100","pieces":"0"},
  ];
  static int _thingCounter = 3;
  int _sum = 0;
  int _tax = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('$_thingCounter 合計：$_sum 円(消費税 $_tax ％込)'),
        backgroundColor: Colors.black,
      ),
      body:ListView.builder(
            itemBuilder: (BuildContext context,int i){
              if(i.isOdd) return Divider();
              final index = i ~/ 2;
              if(index < _thingCounter){
                return Container( padding: const EdgeInsets.all(8),
                  child: Row(children: [

                    //商品名
                    Expanded(
                      flex: 30,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: _thingCounter.toString() + "商品名",
                        ),
                        style: new TextStyle(
                          fontSize: 18.0,              
                        ),
                        controller: myController,
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
                        controller: myController                    
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
                              controller: myController
                            ),
                          ),

                  ],),
                ); 
              }
            }
          ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewList(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  
  _createNewList(){
    setState(() {//この中に変数の処理を書く
      _thingCounter++;
    });
  }

  void  _changeItemData(int id,String goodsName,int price,int pieces){//数値を反映させる
    setState(() {//この中に変数の処理を書く
      listItems.add({"id":_thingCounter.toString(),"goods":goodsName,"price":price,"pieces":pieces});
    });
  }

}
