import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingRequest extends StatelessWidget {
  const LoadingRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: SizedBox(
          width: deviceWidth * 0.4,
          height: deviceWidth * 0.4,
          child: const LoadingIndicator(
              indicatorType: Indicator.ballClipRotateMultiple,
              colors: [Colors.green, Colors.greenAccent],
              strokeWidth: 2,
              backgroundColor: Colors.transparent,
              pathBackgroundColor: Colors.transparent),
        ),
      ),
    );
  }
}
