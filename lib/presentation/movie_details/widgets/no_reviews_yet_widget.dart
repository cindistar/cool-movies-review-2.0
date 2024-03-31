import 'package:flutter/material.dart';

class NoReviewsYetWidget extends StatelessWidget {
  const NoReviewsYetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(8),
            width: 200,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No reviews yet!",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(width: 10),
                Icon(Icons.reviews, color: Colors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
