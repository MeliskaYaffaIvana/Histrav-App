import 'package:flutter/material.dart';
import 'package:histrav_app_flutter/model/custom_colors.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/LogoClass.png',
          height: 20,
        ),
        SizedBox(width: 8),
        Text(
          'Class',
          style: TextStyle(
            color: CustomColors.appPurple3,
            fontSize: 18,
          ),
        ),
        Text(
          ' Scheduler',
          style: TextStyle(
            color: CustomColors.appPurple1,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
