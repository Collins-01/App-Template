import 'package:equatable/equatable.dart';

import '../../../../core/models/models.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

enum HomeViewModelStatus { idle, loading, error, success }

extension HomeViewModelStatusX on HomeViewModelStatus {
  bool get isBusy => this == HomeViewModelStatus.loading;
  bool get isIdle => this == HomeViewModelStatus.idle;
  bool get isError => this == HomeViewModelStatus.error;
  bool get isSuccess => this == HomeViewModelStatus.success;
}

class HomeViewModelState extends Equatable {
  final HomeViewModelStatus status;
  final String errorMessage;
  final Stream<List<Post>> posts;
  const HomeViewModelState({
    this.status = HomeViewModelStatus.idle,
    this.posts = const Stream.empty(),
    this.errorMessage = '',
  });

  HomeViewModelState copyWith(
      {HomeViewModelStatus? status,
      String? errorMessage,
      Stream<List<Post>>? posts}) {
    return HomeViewModelState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        posts: posts ?? this.posts);
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
