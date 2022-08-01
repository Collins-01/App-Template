import 'package:app_template/core/models/models.dart';
import 'package:app_template/presentation/riverpod_implentation/home/viewmodels/viewmodels.dart';
import 'package:app_template/presentation/riverpod_implentation/widgets/loader_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../home/states/states.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(homeViewModelInstance);
    return LoaderPage(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Oriakhcolls01@gmail.com"),
          ),
          body: StreamBuilder<List<Post>>(
            builder: (context, snapshot) {
              if (vm.status.isSuccess && snapshot.hasData) {
                //
                final data = snapshot.data as List<Post>;
                return ListView.builder(
                  itemBuilder: (_, index) => Text(data[index].name),
                );
              }

              if (vm.status.isBusy &&
                  (snapshot.data == null || snapshot.data!.isEmpty)) {
                return const SizedBox.shrink();
              }
              return const BuildEmptyPosts();
            },
            stream: vm.posts,
          )),
      isBusy: vm.status.isBusy,
    );
  }
}

class BuildEmptyPosts extends StatelessWidget {
  const BuildEmptyPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No Posts"),
    );
  }
}
