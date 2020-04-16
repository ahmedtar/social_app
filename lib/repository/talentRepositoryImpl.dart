

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/model/Categorie.dart';
import 'package:social_app/model/Talent.dart';

import 'talentRepository.dart';
//import 'package:social_app/view/accueil/actualite_page.dart';

final usersRef=Firestore.instance.collection("Talents");

class TalentRepositoryImpl implements TalentRepository  {

  final FirebaseAuth auth = FirebaseAuth.instance;
  String uid = '';

  @override
  Future<int> createTalent(Talent talent)async {
    int r=0;
    try{
        await usersRef.add(talent.toMap());
        r=1;
    }catch(e){
      print(e);
    }
    return r;
  }

  @override
  Future<int> updateTalent(Talent talent)async{
    int r=0;
    try{
      if(await exists(talent.uid)==true){
        await usersRef.document(talent.uid).updateData(talent.toMap());
        r=1;
      }
    }catch(e){
      print(e);
    }
  return r;
  }

  @override
  Future<int> deleteTalent(String id)async{
    int r=0;
      try{
        if(await exists(id)==true){
    await usersRef.document(id).delete();
    r=1;
        }
    }catch(e){
      print(e);
    }
    return r;
  }

  
  Future<bool> exists(String id)async{
      final doc= await usersRef.document(id).get();
      if(!doc.exists){
        return false;
      }
      return true;
  }

  @override
  Future<List<Talent>> searchByName(String name)async{

    List<Talent> talents=[];
    try{
        var users=await usersRef.where("nom",isEqualTo: name).getDocuments();
        talents=users.documents.map((doc)=>Talent.fromMap(doc.data)).toList();
    }catch(e){
      print(e);
    }
   return talents;
  }

  @override
  Future<List<Talent>> searchByCategorie(Categorie categorie)async {
    List<Talent> talents=[];
    try{
        var users=await usersRef.where("categorie_ID",isEqualTo: categorie.catID).getDocuments();
        talents=users.documents.map((doc)=>Talent.fromMap(doc.data)).toList();
    }catch(e){
      print(e);
    }
   return talents;
  
  }



  Future<String> getcurrentUserUid() async {
  return (await auth.currentUser()).uid;
}


  @override
  Future<List<String>> getTalentInfos() async{
    List<String> list= [];
    final QuerySnapshot snapshot = await usersRef.where('uid', isEqualTo: await TalentRepositoryImpl().getcurrentUserUid())
    .getDocuments();
    snapshot.documents.forEach((DocumentSnapshot doc){
      list = [doc.data['nom'] , doc.data['prenom'] , doc.data['email']
      , doc.data['nationalite']];
    });
    return list;
  }

}