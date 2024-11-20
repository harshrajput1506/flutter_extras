import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomButton extends StatefulWidget {
  
  final Duration duration = const Duration(milliseconds: 70);
  final Widget child;
  final MaterialColor color;
  final GestureTapCallback onPressed;

  const CustomButton({
    super.key,
    required this.child,
    required this.color,
    required this.onPressed
    });
  

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {

  double faceLeft = 20.0;
  double faceTop = 0.0;
  double sideWidth = 20.0;
  double bottomHeight = 20.0;

  final Curve _curve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220.0,
      height: 80.0,
      child: GestureDetector(

        onTapDown: _pressed,
        onTapUp: _unPressedOnTapUp,
        onTapCancel: _unPressed,

        child: Stack(
          children: [
            Positioned(
              top: 0.2,
              child:  Transform(
                origin: const Offset(20, 0),
                transform: Matrix4.skewY(-0.79),
                child: AnimatedContainer(
                  duration: widget.duration,
                  curve: _curve,
                  width: sideWidth,
                  height: 60.0,
                  color: widget.color[800],
                  ),
                ),
            ),

            Positioned(
              top: 60.0,
              left: 20.1,
              child:  Transform(
                transform: Matrix4.skewX(-0.8),
                child: Transform(
                  origin: const Offset(100, 10),
                  transform: Matrix4.rotationZ(math.pi),
                  child: AnimatedContainer(
                  duration: widget.duration,
                  curve: _curve,
                  width: 200,
                  height: bottomHeight,
                  color: widget.color[800],
                  ),
                )
              ),
            ),

            AnimatedPositioned(
              left: faceLeft,
              top: faceTop,
              duration: widget.duration,
              child: Container(
                alignment: Alignment.center,
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: widget.color,
                  border: Border.all(color: widget.color, width: 1),
                ),
                child: widget.child,
              ),
            )
          ],
        ),
       
      )
    );
  }

  void _pressed(_) {
    setState(() {
      faceLeft = 0.0;
      faceTop = 20.0;
      sideWidth = 0.0;
      bottomHeight = 0.0;
    });
    widget.onPressed();
  }

  void _unPressedOnTapUp(_) => _unPressed();

  void _unPressed() {
    setState(() {
      faceLeft = 20.0;
      faceTop = 0.0;
      sideWidth = 20.0;
      bottomHeight = 20.0;
    });
  }
}
