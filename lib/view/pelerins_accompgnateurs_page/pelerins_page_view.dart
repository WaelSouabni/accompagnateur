import 'package:accompagnateur/configuration/Pelerin.dart';
import 'package:accompagnateur/configuration/pelerin_list.dart';
import 'package:accompagnateur/view/login_page/login_page_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class PelerinsPageView extends StatefulWidget {
  const PelerinsPageView({Key? key}) : super(key: key);

  @override
  _PelerinsPageViewState createState() => _PelerinsPageViewState();
}

class _PelerinsPageViewState extends State<PelerinsPageView> {
  
  late SharedPreferences sharedPreferences;
   checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPageView()));    }

  }
   @override
  void initState() {
    checkLoginStatus();  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var futureBuilder =  FutureBuilder(
      future: bringThePelerinAccompgnateur(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return  const Text('loading...');
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return createListView(context, snapshot);
            }
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("قائمة المعتمرين التابعين اليك"),
      ),
      body: futureBuilder,
    );
  }



  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<Pelerin> values = snapshot.data;
    return ListView.builder(
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
               ListTile(
                title:  Text("${values[index].nomArabe} ${values[index].prenomArabe}"),
              ),
               const Divider(height: 2.0,),
            ],
          );
        },
    );
  }
 
 }
