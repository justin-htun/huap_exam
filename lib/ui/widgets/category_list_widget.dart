import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:huap_exam/blocs/category_bloc/category_bloc.dart';
import 'package:huap_exam/configs/app_config.dart';
import 'package:huap_exam/models/category.dart';
import 'package:huap_exam/ui/pages/product_list_page.dart';
import 'package:huap_exam/ui/widgets/empty_widget.dart';

Widget buildCategoryList(BuildContext context, List<Category> categoryList) {
  return RefreshIndicator(
    onRefresh: () async {
      CategoryBloc().add(GetCategoryList());
    },
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "categories".tr(),
            style: TextStyle(fontSize: xLargeFontSize),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: categoryList == null || categoryList.isEmpty
                ? buildEmptyWidget()
                : ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ProductListPage(categoryList![index].name);
                            }),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(20),
                          child: Text(categoryList[index].name.toUpperCase()),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    ),
  );
}
