import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ecommercetask/common/dimesions.dart';
import 'package:ecommercetask/common/navigation.dart';
import 'dart:math' as math;

import 'package:ecommercetask/constants/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onTap,
    this.borderColor = Colors.transparent,
    this.buttonColor1 = darkThemeColor,
    this.buttonColor2 = mediumThemeColor,
    this.height = 58,
    this.width,
    this.borderRadius = 16,
    this.borderWidth = 1,
    required this.buttonText,
    this.buttonTextColor = Colors.white,
    this.buttonFontSize = 17,
    this.fontFamily = 'bold',
    this.isLoading = false,
    this.iconGap = 0,
    this.iconData,
    this.iconSize = 0,
    this.loaderBackColor = Colors.white38,
    this.loaderProgressColor = Colors.white,
  });
  final Function() onTap;
  final Color? borderColor;
  final Color? buttonColor1;
  final Color? buttonColor2;
  final double? height;
  final double? width;
  final double? borderWidth;
  final double? borderRadius;
  final String buttonText;
  final Color? buttonTextColor;
  final double? buttonFontSize;
  final double? iconGap;
  final double? iconSize;
  final String? fontFamily;
  final bool? isLoading;
  final IconData? iconData;
  final Color? loaderBackColor;
  final Color? loaderProgressColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading! ? null : onTap,
      child: Container(
        height: height,
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor!),
          gradient: LinearGradient(
            colors: [buttonColor1!, buttonColor2!],
            end: Alignment.centerRight,
            begin: Alignment.centerLeft,
          ),
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: isLoading!
            ? CustomProgressIndicator(
                color: loaderBackColor!,
                height: height! * 0.8,
                progressColor: loaderProgressColor!,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidthGap(gap: iconGap!),
                  Icon(iconData, size: iconSize, color: buttonTextColor),
                  WidthGap(gap: iconGap!),
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: buttonTextColor,
                      fontSize: buttonFontSize,
                      fontFamily: fontFamily,
                    ),
                  ),
                  WidthGap(gap: iconGap!),
                ],
              ),
      ),
    );
  }
}

//! when button in bottom bar

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          right: screenWidth(context) * 0.03,
          left: screenWidth(context) * 0.03,
          bottom: screenHeight(context) * 0.006,
          top: screenHeight(context) * 0.006,
        ),
        child: child,
      ),
    );
  }
}

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({
    super.key,
    this.color = const Color.fromRGBO(207, 216, 220, 1),
    this.height = 40,
    this.progressColor = themeColor,
  });
  final Color? color;
  final Color? progressColor;
  final double? height;
  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value * 2 * math.pi,
          child: Center(
            child: CircularProgressBar(
              progress: 0.6,
              strokeWidth: 2.20,
              backgroundColor: widget.color!,
              progressColor: widget.progressColor!,
              height: widget.height!,
            ),
          ),
        );
      },
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.color = themeColor});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.pop();
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: color!.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}

class CircularProgressBar extends StatelessWidget {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final double height;

  const CircularProgressBar({
    super.key,
    required this.progress,
    this.strokeWidth = 8.0,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(height, height),
      painter: _CircularProgressPainter(
        progress: progress,
        strokeWidth: strokeWidth,
        backgroundColor: backgroundColor,
        progressColor: progressColor,
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  _CircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = (size.width / 2) - strokeWidth / 2;
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, backgroundPaint);

    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
