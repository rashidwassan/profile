import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web_portfolio/utils/constants.dart';

dynamic showGetStartedDialog(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          children: [
            Container(
              color: Colors.transparent,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      24.heightBox,
                      double.infinity.widthBox,
                      Text(
                        'This feature will be available soon!',
                      ),
                      24.heightBox,
                      Text('Sorry for inconvienience.'),
                      32.heightBox,
                      MaterialButton(
                        height: 40,
                        focusElevation: 0,
                        highlightElevation: 0,
                        color: kPrimaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPressed: () {
                          context.pop();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dismiss'),
                          ],
                        ),
                      ).px(24),
                    ],
                  ).py(24),
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(Icons.close))
                ],
              ),
            ),
          ],
        );
      });
}
