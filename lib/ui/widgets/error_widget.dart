import 'package:flutter/material.dart';
import 'package:huap_exam/configs/app_config.dart';

Widget buildErrorWidget() {
  return Center(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(Icons.error_outline, size: 80,),
          const SizedBox(
            height: 10,
          ),
          Text(
            'No internet connection or something went wrong',
            style: TextStyle(fontSize: smallFontSize, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}