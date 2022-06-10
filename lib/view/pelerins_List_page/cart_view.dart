import 'package:accompagnateur/view/pelerins_List_page/widgets/Pelerin_list.dart';
import 'package:flutter/material.dart';

class PelerinsListView extends StatefulWidget {
  const PelerinsListView({Key? key}) : super(key: key);

  @override
  _PelerinsListViewState createState() => _PelerinsListViewState();
}

class _PelerinsListViewState extends State<PelerinsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title : Text("My Cart", style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 4, 0, 255),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: PelerinListWidget(),
    );
  }
}
