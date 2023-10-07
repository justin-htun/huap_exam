import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:huap_exam/configs/app_config.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/images/huap_logo.webp",
                width: 80,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "language".tr(),
                style: TextStyle(fontSize: xLargeFontSize),
              ),
              const Divider(),
              RadioListTile(
                  title: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: [
                      Image.asset(
                        "assets/images/thailand_flag.png",
                        width: 30,
                        height: 30,
                      ),
                      const Text("ไทย")
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: 'th',
                  groupValue: context.locale.languageCode,
                  onChanged: (String? val) {
                    if (context.locale.languageCode != 'th') {
                      context.setLocale(const Locale('th', 'TH'));
                    }
                  }),
              RadioListTile(
                  title: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: [
                      Image.asset(
                        "assets/images/us_flag.png",
                        width: 30,
                      ),
                      const Text("English")
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: 'en',
                  groupValue: context.locale.languageCode,
                  onChanged: (String? val) {
                    if (context.locale.languageCode != 'en') {
                      context.setLocale(const Locale('en', 'US'));
                    }
                  }),
            ],
          ),
        ),
      ],
    ),
  );
}
