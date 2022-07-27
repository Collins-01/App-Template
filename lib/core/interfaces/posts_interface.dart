import 'package:app_template/core/models/models.dart';

abstract class PostsInterface {
  Stream<List<Post>> get streamPostsList;
  Future<void> getPosts();
  Future<Post> getSinglePost(String id);
  Future<void> deletePost(String id);
  Future<void> createPost(Post post);
  Future<void> updatePost(Post post);
}

abstract class PostsRepository implements PostsInterface {}

abstract class PostsService implements PostsInterface {}
