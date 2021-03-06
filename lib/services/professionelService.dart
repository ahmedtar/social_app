import 'package:social_app/model/Professionnel.dart';
import 'package:social_app/repository/proRepository.dart';
import 'package:social_app/repository/proRepositoryImpl.dart';

class ProfessionelService {
  ProfessionnelRepository professionnelRepository;

  ProfessionelService() {
    professionnelRepository = ProfessionelRepositoryImpl();
  }

  Future<int> createProfessionnel(Professionnel pro) {
    return professionnelRepository.createProfessionnel(pro);
  }

  Future<int> updateProfessionnel(Professionnel pro) {
    return professionnelRepository.updateProfessionnel(pro);
  }

  Future<int> deleteProfessionnel(String id) {
    return professionnelRepository.deleteProfessionnel(id);
  }
  Future<bool> exists(String id){
    return professionnelRepository.exists(id);
  }

  Future<Professionnel> getCurrentPro(){
    return professionnelRepository.getCurrentPro();
  }

  Future<Professionnel> searchById(String id){
    return professionnelRepository.searchById(id);
  }

}
