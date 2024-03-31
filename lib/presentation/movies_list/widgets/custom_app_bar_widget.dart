import 'package:coolmovies/core/util/utils.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _colorAnimation = ColorTween(
      begin: const Color.fromARGB(255, 235, 233, 88),
      end: MovieColors.lilacGarden,
    ).animate(_controller);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: CustomPaint(
        painter: AppBarPainter(_colorAnimation),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                MovieWords.coolMovies,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AppBarPainter extends CustomPainter {
  final Animation<Color?> colorAnimation;

  AppBarPainter(this.colorAnimation) : super(repaint: colorAnimation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = colorAnimation.value!;
    RRect rrect = RRect.fromLTRBR(
        0, 0, size.width, size.height, const Radius.circular(15));
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(AppBarPainter oldDelegate) {
    return oldDelegate.colorAnimation != colorAnimation;
  }
}
