import 'package:flutter/material.dart';
import 'package:huap_exam/ui/widgets/shimmer_widget.dart';

Widget buildHomePageLoadingWidget() {
  return AnimatedOpacity(
    duration: const Duration(milliseconds: 200),
    opacity: 1.0,
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20),
                    child: Row(
                      children: [
                        buildShimmerWidget(width: 100, height: 20),
                      ],
                    ),
                  ));
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
            itemCount: 9)),
  );
}
