import 'package:dbook/core/viewobject/book.dart';
import 'package:dbook/screen/book/widgets/book_vertical_list_item.dart';
import 'package:dbook/screen/common/customshimmer.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constant/dimesions.dart';

class BookVerticalList extends StatelessWidget {
  const BookVerticalList(
      {Key? key,
      required this.isLoading,
      required this.dataLength,
      required this.refresh,
      this.dataList,
      required this.hasData})
      : super(key: key);
  final bool isLoading;
  final bool hasData;
  final int dataLength;
  final List<Book>? dataList;
  final Function refresh;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimesion.height10),
      child: Column(children: [
        MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: Dimesion.height20,
                    mainAxisSpacing: Dimesion.height10,
                    mainAxisExtent: Dimesion.height40 * 6),
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: isLoading ? 4 : dataLength,
                itemBuilder: (context, index) {
                  return isLoading
                      ? const CustomShimmer()
                      : BookVarticalListItem(
                          book: dataList![index], refresh: refresh);
                })),
        SizedBox(
          height: Dimesion.height10,
        ),
      ]),
    );
  }
}
