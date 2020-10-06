import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class LoadingWidget extends StatelessWidget {
  double size;
  bool circular = false;
  LoadingWidget({this.size, this.circular = false});
  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      color: Colors.transparent,
      child: circular
          ? CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).primaryColor,
        ),
      )
          : SpinKitThreeBounce(
        size: this.size == null ? this.size = 25 : this.size,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
