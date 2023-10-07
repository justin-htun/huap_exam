import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final double? width, height;
  final BorderRadius? borderRadius;

  const ImageWidget(
      {Key? key,
        required this.url,
        required this.fit,
        this.height,
        this.borderRadius,
        this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:  borderRadius ?? BorderRadius.circular(5),
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: const Center(
              child: CupertinoActivityIndicator(
                animating: true,
                radius: 11,
              ),
            ),
          );
        },
        errorWidget: (context, url, error) => Image.asset(
          "assets/images/huap_logo.png",
          fit: BoxFit.contain,
        ),
        fit: fit,
        width: width,
        height: height,
      ),
    );
  }
}