import 'package:flutter/material.dart';
import 'package:matreshka/models/number.dart';
import 'package:matreshka/utils/colors.dart';
import 'package:matreshka/utils/fonts.dart';

class NumberWidget extends StatefulWidget {
  const NumberWidget(
      {super.key, required this.number, required this.onAnimationEnd});

  final Number number;
  final void Function(String) onAnimationEnd;

  @override
  State<NumberWidget> createState() => _NumberWidgetState();
}

class _NumberWidgetState extends State<NumberWidget> {
  final Duration animationDuration = const Duration(seconds: 1);

  bool animationStarted = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {
      animationStarted = true;
    }));

    Future.delayed(animationDuration)
        .then((value) => widget.onAnimationEnd(widget.number.key));
  }

  @override
  Widget build(BuildContext context) {
    final double x = widget.number.initialX;
    final double y = widget.number.initialY;

    return AnimatedPositioned(
        duration: animationDuration,
        top: animationStarted ? y - 150 : y,
        left: x,
        child: AnimatedOpacity(
          duration: animationDuration,
          opacity: animationStarted ? 0 : 1,
          child: Text(
            widget.number.value,
            style: AppFonts.font29w400.copyWith(color: Colors.white),
          ),
        ));
  }
}
