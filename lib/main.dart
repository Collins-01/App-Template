import 'package:app_template/core/data_layer/endpoints.dart';
import 'package:app_template/core/injection_container.dart';
import 'package:app_template/presentation/riverpod_implentation/authentication/authentication.dart';
import 'package:app_template/presentation/riverpod_implentation/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_client/network_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  NetworkClient.init(
    EndPoints.baseUrl,
    // enableLogging: true,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
      observers: [],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}

class AppTemplateObserver extends ProviderObserver {
  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    // super.didAddProvider(provider, value, container);
  }
}
