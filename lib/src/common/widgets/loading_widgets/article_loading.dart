import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ArticleLoading extends StatelessWidget {
  const ArticleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 16,
                width: 240,
                color: Colors.grey,
              ),
              Container(
                height: 16,
                width: 320,
                color: Colors.grey,
              ),
              Container(
                height: 16,
                width: 220,
                color: Colors.grey,
              ),
              Container(
                height: 16,
                width: 160,
                color: Colors.grey,
              ),
              // const Text('Loadings...'),
              // const Text('Loadings...')
            ],
          ),
        ),
      ),
    );
  }
}
