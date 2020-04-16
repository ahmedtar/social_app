import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/model/Professionnel.dart';
import 'package:social_app/repository/proRepository.dart';


final userRef=Firestore.instance.collection('Professionels');



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




}