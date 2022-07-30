import 'package:flutter/material.dart';
import 'package:app_template/extensions/extensions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderPage extends StatelessWidget {
  final Widget child;
  final bool isBusy;
  const LoaderPage({Key? key, required this.child, required this.isBusy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: child,
          ),
          isBusy
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.75),
                  child: SpinKitRipple(
                    size: 180,
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.blueAccent,
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
