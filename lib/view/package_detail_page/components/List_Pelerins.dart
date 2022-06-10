import 'package:accompagnateur/view/pelerins_package_List_page/widgets/Pelerin_Package_list.dart';
import 'package:flutter/material.dart';
import '../../home_page/components/size_config.dart';

class ListPelerins extends StatefulWidget {
  const ListPelerins({Key? key}) : super(key: key);

  @override
  _ListPelerinsState createState() => _ListPelerinsState();
}

class _ListPelerinsState extends State<ListPelerins> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return IconButton(
      onPressed: () {
        
          Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PelerinListWidget()));
                                
      },
      icon: Icon(Icons.list),
      color: Colors.white,
      iconSize: SizeConfig.screenHeight! / 22.77,
    );
  }
}
