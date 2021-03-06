import 'package:accompagnateur/view/login_page/login_page_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../configuration/pelerinpackage.dart';
import '../../configuration/pelerinpackage_list.dart';
import '../calendar_page/calendar_page_view.dart';
import '../home_page/components/size_config.dart';
import 'widgets/Package_image.dart';

class packagesPelerinPageView extends StatefulWidget {
  const packagesPelerinPageView({Key? key}) : super(key: key);

  @override
  _PackagesPelerinPageViewState createState() =>
      _PackagesPelerinPageViewState();
}

class _PackagesPelerinPageViewState extends State<packagesPelerinPageView> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("قائمة الرحلات التي اشتركتم فيها ",style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! / 20.0,
            vertical: SizeConfig.screenHeight! / 136.6),

        /// 20.0 - 5.0
        child: FutureBuilder<List<PelerinPackage>>(
            future: bringThePackagesPelerin(),
            builder: (context, snapshot) {
              // print(snapshot.data);
              if (snapshot.hasData) {
                var PackageList = snapshot.data;
                return GridView.builder(
                    itemCount: PackageList!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      childAspectRatio: 3.2 / 4,
                    ),
                    itemBuilder: (context, index) {
                      var Package = PackageList[index];
                      //
                      return Stack(
                        children: [
                          Container(
                              //height: SizeConfig.screenHeight! / 3.10,

                              /// 220.0
                              // width: SizeConfig.screenWidth! / 2.06,

                              /// 200.0
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                      color: Colors.black.withOpacity(0.1),
                                    )
                                  ]),
                              child: Stack(
                                children: [
                                  PackagesPelerinDetail(
                                    image: Package.image.toString(),
                                    labelle: Package.labelle,
                                    etat: Package.etat,
                                    created_at: Package.created_at,
                                  ),
                                  IconButton(
                                icon: const Icon(Icons.calendar_month),
                                onPressed: () {
                                  // Do something.
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CalendarCart(dateDepart: Package.dateDepart,Labelle: Package.labelle,)));
                                }),
                                ],
                              )),
                        ],
                      );
                    });
              } else {
                return Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.screenHeight! / 3.10),

                  /// 200.0
                  child: Column(
                    children: [
                      Center(
                          child: Icon(
                        Icons.flight,
                        color: Colors.black12,
                        size: SizeConfig.screenHeight! / 11.39,
                      )),

                      /// 60.0
                      /* SizedBox(
                        height: SizeConfig.screenHeight! / 34.15,
                      ),*/
                      /// 20.0
                      Center(
                          child: Text(
                        " ",
                        style: TextStyle(
                            color: Colors.black12,
                            fontSize: SizeConfig.screenHeight! / 34.15),
                      ))

                      /// 20.0
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
