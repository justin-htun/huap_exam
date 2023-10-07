import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerWidget({required double width, required double height}) =>
    Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade300,
      direction: ShimmerDirection.ltr,
      enabled: true,
      child: Card(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          width: width,
          height: height,
        ),
      ),
    );
