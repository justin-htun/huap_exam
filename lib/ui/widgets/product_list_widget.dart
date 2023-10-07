import 'package:flutter/material.dart';
import 'package:huap_exam/models/product_list_model.dart';
import 'package:huap_exam/ui/widgets/empty_widget.dart';
import 'package:huap_exam/ui/widgets/image_widget.dart';

Widget buildProductList(BuildContext context, ProductListModel productListModel) {
  return Container(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 20),
    child: productListModel.products == null || productListModel.products!.isEmpty
        ? buildEmptyWidget()
        : ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
      itemCount: productListModel.products!.length,
      itemBuilder: (context, index) {
        Products product = productListModel.products![index];
        return InkWell(
          onTap: () {
          },
          child: Card(
            surfaceTintColor: Colors.white,
            child: Row(
              children: [
                ImageWidget(
                  url: product.thumbnail??"",
                  fit: BoxFit.cover,
                  width: 110.0,
                  height: 110.0,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10), bottomLeft: Radius.circular(10),
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productListModel.products![index].title ?? "", style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black),),
                      const SizedBox(height: 10,),
                      Text(productListModel.products![index].description ?? "", maxLines: 2, overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                ),
                const SizedBox(width: 5,),
              ],
            ),
          ),
        );
      },
    ),
  );
}
