import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class EmptyList extends StatelessWidget {
  final String image;
  final String text;
  final bool imageValidate;
  final double fontSize;

  EmptyList(
      {this.image = 'assets/images/not_found.png',
        this.text = 'Não encontramos nenhuma conversão',
        this.imageValidate = false,
        this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            imageValidate == true
                ? ContainerResponsive(
              heightResponsive: true,
              widthResponsive: true,
              height: 180,
              width: 180,
              child: Image(
                image: AssetImage(image),
              ),
            )
                : Container(),
            SizedBox(height: 20),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
