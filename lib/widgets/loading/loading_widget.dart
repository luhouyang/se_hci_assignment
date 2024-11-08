import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management/widgets/ui_color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget {
  Dialog circularLoadingWidget(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: AdaptiveTheme.of(context).mode.isLight ? UIColor().secondaryBlue : UIColor().secondaryOrange,
          size: 50,
        ),
      ),
    );
  }
}
