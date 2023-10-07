import 'package:flutter/material.dart';
import 'package:huap_exam/ui/widgets/shimmer_widget.dart';

Widget buildProductListPageLoadingWidget() {
  return AnimatedOpacity(
    duration: const Duration(milliseconds: 200),
    opacity: 1.0,
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: ListView.separated(
          itemCount: 9,
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Row(
                    children: [
                      buildShimmerWidget(width: 90, height: 90),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildShimmerWidget(width: 100, height: 25),
                          buildShimmerWidget(width: 200, height: 40),
                        ],
                      )
                    ],
                  ),
                ));
          },
        )),
  );
}
