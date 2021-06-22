import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const SimpleListView(),
      //home: const ListTileView(),
      //home: const ListViewBuilder(),
      home: const ScrollDirection(),
    );
  }
}

// デフォルトコンストラクタ（ListView()）でのシンプルな記述
// 読み込み時にリストの中身を全て表示するので量が多いリストには不向き
// メニュー画面や設定画面の項目などの表示に使うと良い
class SimpleListView extends StatelessWidget {
  const SimpleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // あらかじめ定数化したリストを用意
    const data = [Text("item0"), Text("item1"), Text("item2"), Text("item3")];

    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleListView"),
      ),
      body: ListView(
        children: data, // childrenプロパティにセット
      ),
    );
  }
}

// ListTileを使った方法
// ListTileクラスには一覧表示によく使われるコンテンツが簡単にセットできる。
class ListTileView extends StatelessWidget {
  const ListTileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListTileView"),
      ),
      body: ListView(
        children: [
          // Widgetの呼び出し
          _menuItem("menu1", const Icon(Icons.settings)),
          _menuItem("menu2", const Icon(Icons.map)),
          _menuItem("menu1", const Icon(Icons.room)),
          _menuItem("menu1", const Icon(Icons.local_shipping)),
          _menuItem("menu1", const Icon(Icons.airplanemode_active)),
        ], // childrenプロパティにセット
      ),
    );
  }

  // ListTile
  Widget _menuItem(String title, Icon icon) {
    return Container(
      // コンテナに下線をつける
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
        leading: icon, // アイコンなどをセット
        title: Text(
          // 表示したい文字列
          title,
          style: const TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        onTap: () {
          // タップした時の処理
          print("onTap called.");
        },
        onLongPress: () {
          // 長押しした時の処理
          print("onLongPress called");
        },
      ),
    );
  }
}

// ListView.builder
// 画面表示されるたびに実行
// チャットやメッセージ、検索結果など、表示する要素が事前にわからない時に使う
class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = ["message1", "message2", "message3", "message4"];
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListViewBuilder"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index >= list.length) {
            list.addAll(["message1", "message2", "message3", "message4"]);
          }
          return _menuItem(list[index], index);
        },
      ),
    );
  }

  Widget _menuItem(String title, int index) {
    return Container(
      // コンテナに下線をつける
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
        title: Text(
          // 表示したい文字列
          title,
          style: const TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        onTap: () {
          // タップした時の処理
          print("onTap called on $index cell.");
        },
        onLongPress: () {
          // 長押しした時の処理
          print("onLongPress called on $index cell");
        },
      ),
    );
  }
}

// ScrollDirectionを指定し、スクロールの方向を変える
class ScrollDirection extends StatelessWidget {
  const ScrollDirection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numbersList = ["0", "1", "2", "3"];
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScrollDirection"),
      ),
      body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if (index >= numbersList.length) {
              numbersList.addAll(["0", "1", "2", "3"]);
            }
            return _messageItem(numbersList[index]);
          }),
    );
  }

  Widget _messageItem(String title) {
    return Container(
      width: 100,
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(width: 1.0, color: Colors.grey))),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
    );
  }
}
