import 'package:accompagnateur/view/home_page/components/size_config.dart';
import 'package:flutter/material.dart';

class PelerinImage extends StatefulWidget {
  String PelerinImg;
  PelerinImage({required this.PelerinImg});

  @override
  _PelerinImageState createState() => _PelerinImageState();
}

class _PelerinImageState extends State<PelerinImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight!/8.54,                 /// 80.0
      width: SizeConfig.screenWidth!/4.57,                   /// 90.0
      decoration: BoxDecoration(
        image: DecorationImage(   
          image: ExactAssetImage('assets/main/pngkey.com-profile-icon-png-2024792.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
