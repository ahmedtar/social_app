


import 'package:social_app/model/Post.dart';
import 'package:social_app/model/Talent.dart';
import 'package:social_app/repository/postRepository.dart';
import 'package:social_app/repository/postRepositoryImpl.dart';

class PostService {
  
PostRepository postRepository;

  PostService(){
    postRepository=PostRepositoryImpl();
  }


    Future<int> createPost(Post post) {
    return postRepository.createPost(post);
  }

  Future<int> updatePost(Post post) {
    return postRepository.updatePost(post);
  }


  Future<int> deletePost(String id) {
    return postRepository.deletePost(id);
  }

  Future<List<Post>> searchByUser(Talent talent) {
    return postRepository.searchByUser(talent);
  }











}