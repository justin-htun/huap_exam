import 'package:flutter/material.dart';
import 'package:huap_exam/configs/app_config.dart';
import 'package:huap_exam/ui/widgets/empty_widget.dart';

Widget buildCategoryList(BuildContext context, List<String> categoryList) {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Categories", style: TextStyle(fontSize: xLargeFontSize),),
        const Divider(),
        const SizedBox(height: 10,),
        Expanded (
          child: categoryList == null || categoryList.isEmpty
              ? buildEmptyWidget()
              : ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black54,
                          ), 
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Text(categoryList[index].toUpperCase()),
                      ),
                    );
                  },
                ),
        ),
      ],
    ),
  );
}
