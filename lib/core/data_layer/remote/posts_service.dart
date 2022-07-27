import 'package:app_template/core/interfaces/posts_interface.dart';
import 'package:app_template/core/models/post_model.dart';
import 'package:rxdart/rxdart.dart';

class PostsServiceImpl implements PostsService {
  final _postsController = BehaviorSubject<List<Post>>.seeded([]);
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
  Stream<List<Post>> get streamPostsList =>
      _postsController.asBroadcastStream();

  @override
  Future<void> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
