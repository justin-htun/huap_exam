import 'package:easy_localization/easy_localization.dart';
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
            'no_internet_or_something_wrong'.tr(),
            style: TextStyle(fontSize: smallFontSize, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}