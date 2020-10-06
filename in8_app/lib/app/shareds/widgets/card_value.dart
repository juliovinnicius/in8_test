import 'package:flutter/material.dart';
import 'package:in8_app/app/shareds/constants/geral_contants.dart';
import 'package:in8_app/app/shareds/helpers/color_helper.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CardValue extends StatelessWidget {
  final double oldValue;
  final double newValue;

  CardValue({this.oldValue, this.newValue});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ContainerResponsive(
      width: size.width,
      margin: EdgeInsetsResponsive.only(
        top: 25,
        left: DEFAULT_PADDING_W,
        right: 11,
      ),
      widthResponsive: true,
      child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          child: ContainerResponsive(
            height: 95,
            heightResponsive: true,
            widthResponsive: true,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // NOTE store name

                ContainerResponsive(
                  width: MediaQuery.of(context).size.width * 0.63,
                  widthResponsive: true,
                  child: TextResponsive(
                    '$oldValue',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorLib.textColor.color,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 3),
                ContainerResponsive(
                  width: MediaQuery.of(context).size.width * 0.63,
                  widthResponsive: true,
                  child: TextResponsive(
                    '$newValue',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorLib.grayChateau.color,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 3),
                // SizedBox(height: 3),
              ],
            )
          ),
      ),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(187, 179, 179, 0.2),
            blurRadius: 8.0, // has the effect of softening the shadow
            spreadRadius: 0.0, // has the effect of extending the shadow
            offset: Offset(0, 4),
          )
        ],
      ),
    );
  }
}
