import 'package:dbook/core/provider/book/book_provider.dart';
import 'package:dbook/screen/book/widgets/book_vertical_list_item.dart';
import 'package:dbook/screen/common/customshimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/dimesions.dart';

class BookVerticalList extends StatelessWidget {
  const BookVerticalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookProvider>(
        builder: (BuildContext context, BookProvider pro, Widget? child) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: Dimesion.height10),
        child: Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(vertical: Dimesion.height10),
            child: Text(
              "Recent Books",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: Dimesion.height20,
                      mainAxisSpacing: Dimesion.height10,
                      mainAxisExtent: Dimesion.height40 * 5.6),
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pro.hasData ? pro.datalength : 4,
                  itemBuilder: (context, index) {
                    return pro.hasData
                        ? BookVarticalListItem(
                            book: pro.data.data![index],
                          )
                        : const CustomShimmer();
                  })),
          SizedBox(
            height: Dimesion.height10,
          ),
        ]),
      );
    });
  }
}
