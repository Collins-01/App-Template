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
  void initState() {
    ref.read(homeViewModelInstance.notifier).getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(homeViewModelInstance);
    return LoaderPage(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("oriakhcolls01@gmail.com"),
          ),
          body: StreamBuilder<List<Post>>(
            builder: (context, snapshot) {
              if (vm.status.isSuccess && snapshot.hasData) {
                //
                final data = snapshot.data as List<Post>;
                if (data.isNotEmpty) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(data[index].name),
                    ),
                  );
                }
                return const BuildEmptyPosts();
              }

              if (vm.status.isBusy &&
                  (snapshot.data == null || snapshot.data!.isEmpty)) {
                return const SizedBox.shrink();
              }
              if (vm.status.isBusy) {
                return const SizedBox.shrink();
              }
              return const SizedBox.shrink();
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
