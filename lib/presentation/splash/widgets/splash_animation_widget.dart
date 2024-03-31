import 'package:coolmovies/core/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashAnimationWidget extends StatefulWidget {
  const SplashAnimationWidget({super.key});

  @override
  SplashAnimationWidgetState createState() => SplashAnimationWidgetState();
}

class SplashAnimationWidgetState extends State<SplashAnimationWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() => setState(() {}));

    _colorAnimation =
        ColorTween(begin: MovieColors.greenApple, end: MovieColors.lilacGarden)
            .animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Transform.scale(
            scale: _scaleAnimation.value,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  MovieWords.coolMovies,
                  style: TextStyle(
                    fontSize: 40.0,
                    color: _colorAnimation.value,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SvgPicture.asset(
                  AssetsPaths.popcorn,
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
