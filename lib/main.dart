

import 'package:flutter/material.dart';
import 'package:social_app/view/accueil/actualite_page.dart';
import 'package:social_app/view/accueil/home.dart';
import 'package:social_app/view/authenticate/authenticate.dart';
import 'package:social_app/view/authenticate/login_page.dart';
import 'package:social_app/view/authenticate/register_page.dart';
import 'package:social_app/view/profil/pro_profile_page.dart';
import 'package:social_app/view/shared/constants.dart';

//GetIt getIt = GetIt.instance;

void main() {
//getIt.registerSingleton<TalentService>(TalentService(),
  //    signalsReady: true);
runApp(MyApp());

} 

class MyApp extends StatelessWidget {
 static UserType userType;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:Authenticate.id,
      //initialRoute:Home.id,
      routes: {
        Authenticate.id : (context) => Authenticate(),
        LoginPage.id : (context) => LoginPage(),
        Register.id : (context) => Register(),
        ActualitePage.id : (context) => ActualitePage(),
        Home.id : (context) => Home(userType: userType),
        ProProfilPage.id:(context)=>ProProfilPage(),
     },
    );
  }
}   