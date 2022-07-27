import 'package:app_template/presentation/riverpod_implentation/widgets/loader_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/states.dart';
import '../viewmodels/viewmodels.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var model = ref.read(loginViewModelInstance.notifier);
    return Consumer(
      builder: (context, watch, child) {
        var vm = watch.watch(loginViewModelInstance.notifier);
        return LoaderPage(
          child: Scaffold(
            body: Column(
              children: [
                TextButton(
                  onPressed: () {
                    model.login('email', 'password');
                    print(model.state.loginError);
                  },
                  child: const Text("Login"),
                )
              ],
            ),
          ),
          isBusy: vm.state.status.isBusy,
        );
      },
    );
  }
}
