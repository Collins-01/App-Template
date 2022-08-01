import 'package:app_template/core/injection_container.dart';
import 'package:app_template/core/interfaces/interfaces.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_client/network_client.dart';

import '../states/states.dart';

final _postsService = locator<PostsRepository>();

class HomeViewModel extends StateNotifier<HomeViewModelState> {
  final Ref ref;
  HomeViewModel(this.ref) : super(const HomeViewModelState());

  Future<void> getPosts() async {
    try {
      state = state.copyWith(status: HomeViewModelStatus.loading);
      await _postsService.getPosts();
      state = state.copyWith(
        status: HomeViewModelStatus.success,
        posts: _postsService.streamPostsList,
      );
    } on Failure catch (e) {
      state = state.copyWith(
        status: HomeViewModelStatus.error,
        errorMessage: e.message,
      );
      //Handle Errors
    }
  }
}

final homeViewModelInstance =
    StateNotifierProvider<HomeViewModel, HomeViewModelState>(
        (ref) => HomeViewModel(ref));
