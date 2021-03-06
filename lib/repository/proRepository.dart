

import 'package:social_app/model/Professionnel.dart';

abstract class ProfessionnelRepository{
  Future<int> createProfessionnel(Professionnel pro);
  Future<int> updateProfessionnel(Professionnel pro);
  Future<int> deleteProfessionnel(String id);
  Future<bool> exists(String id);
  Future<Professionnel> getCurrentPro();
  Future<Professionnel> searchById(String id);
}