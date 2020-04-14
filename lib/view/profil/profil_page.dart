import 'package:flutter/material.dart';
import 'package:social_app/services/talentService.dart';
import 'package:social_app/view/shared/reusable_header.dart';


class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  TalentService talentService = TalentService();

  String nom ;
  String prenom;
  String email ;
  String nationalite;

getInfos() async{

   List list =await talentService.getCurrentUSerInfos();
   nom= list[0];
   prenom = list[1];
   email= list[2];
   nationalite = list[3];
   print(nom);
   print(prenom);
   print(email);
   print(nationalite);
}

setinfo(){}

  @override
  void initState() {
    getInfos();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, "profil"),
        body: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF009688),
                
                borderRadius: new BorderRadius.only(
                    bottomLeft:  const  Radius.circular(60.0),
                    bottomRight: const  Radius.circular(60.0))
              ),
              
              child: Column(children: <Widget>[
                SizedBox(
                  height: 3,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/3.jpg'),
                  radius: 60,
                ),
                SizedBox(
                  height: 8,
                ),
                Text('$nom $prenom',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                Text('$email, $nationalite',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38)),    
                Text('Category',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45)),
                SizedBox(
                  height: 8,
                )
                
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text('new post',style: TextStyle(fontSize: 25),),
                  ),
                  )
              ],
            ),

            Text(
              'Posts',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
            ),
            Container(
              child: Wrap(
                children: <Widget>[
                  for (int i = 0; i < 10; i++)
                    Container(
                      height: MediaQuery.of(context).size.width / 3,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/3.jpg'),
                        fit: BoxFit.cover,
                      )),
                    )
                ],
              ),
            )
          ],
        ));
  }
}
