import 'package:app_template/presentation/riverpod_implentation/widgets/loader_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/states.dart';
import '../viewmodels/viewmodels.dart';
import '../../../../extensions/extensions.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var model = ref.read(loginViewModelInstance.notifier);
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
          var vm = watch.watch(loginViewModelInstance);
          return LoaderPage(
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.percentageHeight(0.5),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        model.login('email', 'password');
                        // ignore: invalid_use_of_protected_member, avoid_print
                        print(model.state.loginError);
                      },
                      child: const Text("Login"),
                    ),
                  )
                ],
              ),
            ),
            isBusy: vm.status.isBusy,
          );
        },
      ),
    );
  }
}
