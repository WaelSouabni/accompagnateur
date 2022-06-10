import 'package:accompagnateur/configuration/Pelerin.dart';
import 'package:accompagnateur/configuration/pelerin_list.dart';
import 'package:accompagnateur/view/home_page/components/size_config.dart';
import 'package:accompagnateur/view/pelerins_package_List_page/widgets/pelerin_list_widget/Pelerin_image.dart';
import 'package:accompagnateur/view/pelerins_package_List_page/widgets/pelerin_list_widget/pelerin_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PelerinListWidget extends StatefulWidget {
  const PelerinListWidget({Key? key}) : super(key: key);

  @override
  _PelerinListState createState() => _PelerinListState();
}

class _PelerinListState extends State<PelerinListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "قائمة المعتمرين التابعين اليك",
          style: TextStyle(color: Colors.black),
        ),leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 10, 81, 161),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! / 20),
        child: FutureBuilder<List<Pelerin>>(
            future: bringThePelerinAccompgnateur(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var AccompgnateurList = snapshot.data;
                return ListView.builder(
                    itemCount: AccompgnateurList!.length,
                    itemBuilder: (context, index) {
                      var Accompgnateur = AccompgnateurList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.screenHeight! / 68.3),

                        /// 10.0
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            setState(() {});
                          },
                          background: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.screenWidth! / 20.55),

                            /// 20.0
                            decoration: BoxDecoration(
                              color: Color(0xFFFFE6E6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [Spacer(), Icon(Icons.delete_outline)],
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(4, 6),
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.1),
                                  )
                                ]),
                            child: Row(
                              children: [
                                SizedBox(
                                    width: SizeConfig.screenWidth! / 20.55),

                                /// 20.0
                                PelerinText(
                                    PelerinName: Accompgnateur.nomArabe +
                                        " " +
                                        Accompgnateur.prenomArabe,
                                    PelerinEtat: Accompgnateur.etat),
                                Spacer(),
                                PelerinImage(
                                    PelerinImg:
                                        "main/pngkey.com-profile-icon-png-2024792.png"),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return SizedBox(
                    child: Center(
                  child: Lottie.network(
                      "https://assets10.lottiefiles.com/packages/lf20_peztuj79.json",
                      height: SizeConfig.screenHeight! / 6.83,

                      /// 100.0
                      width: SizeConfig.screenWidth! / 4.11,

                      /// 100.0
                      repeat: false),
                ));
              }
            }),
      ),
    );
  }
}
