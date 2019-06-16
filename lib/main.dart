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
  
  int _sum = 0;
  int _tax = 0;
  static int _thingCounter = 1;

  void _addSum(){

  }


  _createNewData(){//ビルドさせるデータを増やす
    setState(() {//この中に変数の処理を書く
      _thingCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('$_thingCounter 合計：$_sum 円(消費税 $_tax ％込)'),
        backgroundColor: Colors.black,
      ),
      body:_buildBuyList(),//中身の処理は別ウィジェットに任せる
      
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewData,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  Widget _buildBuyList() {//メインコンテンツ
    return ListView(
      children: List.generate(_thingCounter, (int index){
        return Card(
          child: ListTile(
            title: Text('$index:'),
          ),
        );
        return Card(
          child: TextField(
            decoration: const InputDecoration(
              labelText: '商品名'
            ),
          ),
        );
      }),
    );
  }
  
}
