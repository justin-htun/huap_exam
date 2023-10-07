import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:huap_exam/configs/app_config.dart';

Widget buildErrorWidget({required Function() retryAction}) {
  return Center(
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(
            Icons.error_outline,
            size: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'no_internet_or_something_wrong'.tr(),
            style: TextStyle(fontSize: smallFontSize, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: retryAction,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.refresh,
                  color: Colors.black45,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "retry".tr(),
                  style: const TextStyle(color: Colors.black45),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}