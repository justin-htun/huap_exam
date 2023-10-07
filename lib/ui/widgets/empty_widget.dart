import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:huap_exam/configs/app_config.dart';

Widget buildEmptyWidget() {
  return Center(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(Icons.hourglass_empty, size: 80,),
          const SizedBox(
            height: 10,
          ),
          Text(
            'empty'.tr(),
            style: TextStyle(fontSize: smallFontSize, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}