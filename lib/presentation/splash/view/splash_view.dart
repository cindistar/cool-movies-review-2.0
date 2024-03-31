import 'dart:async';
import 'package:coolmovies/presentation/movies_list/view/view.dart';
import 'package:coolmovies/presentation/splash/widgets/widget.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const MoviesListPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: SizedBox(
          height: 500,
          width: double.maxFinite,
          child: SplashAnimationWidget(),
        ),
      ),
    );
  }
}
