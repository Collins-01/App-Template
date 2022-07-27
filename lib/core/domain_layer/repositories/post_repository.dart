import 'package:app_template/core/interfaces/posts_interface.dart';
import 'package:app_template/core/models/post_model.dart';

class PostRepositoryImpl implements PostsRepository {
  final PostsService _postsService;
  PostRepositoryImpl({required PostsService postsService})
      : _postsService = postsService,
        super();
  @override
  Future<void> createPost(Post post) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost(String id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<void> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }

  @override
  Future<Post> getSinglePost(String id) {
    // TODO: implement getSinglePost
    throw UnimplementedError();
  }

  @override
  // TODO: implement streamPostsList
  Stream<List<Post>> get streamPostsList => throw UnimplementedError();

  @override
  Future<void> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
