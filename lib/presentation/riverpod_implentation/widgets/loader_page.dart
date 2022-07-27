import 'package:flutter/material.dart';

class LoaderPage extends StatelessWidget {
  final Widget child;
  final bool isBusy;
  const LoaderPage({Key? key, required this.child, required this.isBusy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
