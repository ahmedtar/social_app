import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/model/Professionnel.dart';
import 'package:social_app/repository/proRepository.dart';


final userRef=Firestore.instance.collection('Professionnels');
final FirebaseAuth auth = FirebaseAuth.instance;


class ProfessionelRepositoryImpl implements ProfessionnelRepository{



  @override
  Future<int> createProfessionnel(Professionnel pro) async{
    int r=0;
    try{
      await userRef.add(pro.toMap());
      r=1;
    }catch(e){
      print(e);
    }
    return r;
  }


  @override
  Future<int> updateProfessionnel(Professionnel pro) async{
    int r=0;
    var doc = await userRef.document(pro.proID).get();
    try{
      if(doc.exists){
        doc.reference.updateData(pro.toMap());
        r=1;
      }
    }catch(e){
      print(e);
    }
    return r;
  }
  @override
   Future<bool> exists(String id)async{
      final doc= await userRef.document(id).get();
      if(!doc.exists){
        return false;
      }
      return true;
  }


    @override
  Future<int> deleteProfessionnel(String id) async{
    int r=0;
    var doc =await userRef.document(id).get();
    try{
      if(doc.exists){
        doc.reference.delete();
        r=1;
      }
    }catch(e){
      print(e);
    }
    return r;
  }

  @override
  Future<Professionnel> getCurrentTalent() {
    return null;
  }


   @override
  Future<Professionnel> getCurrentPro() async{
    
    Professionnel pro;
    FirebaseUser user = await auth.currentUser();
   
    try{
      var doc = await userRef.document(user.uid).get();
          pro =Professionnel.fromMap(doc.data);
    }catch(e){
      print(e);
    }
    return pro;
  }

  @override 
  Future<Professionnel> searchById(String id) async {
    Professionnel pro;
    try {
      var user = await userRef.document(id).get();
      pro = Professionnel.fromMap(user.data);
    } catch (e) {
      print(e);
    }
    return pro;
  }


}