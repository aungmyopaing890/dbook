import 'package:cached_network_image/cached_network_image.dart';
import 'package:dbook/config/route/route_paths.dart';
import 'package:dbook/core/viewobject/book.dart';
import 'package:dbook/core/viewobject/holder/intent_holder/book_detail_intent_holder.dart';
import 'package:dbook/screen/common/customshimmer.dart';
import 'package:flutter/material.dart';
import '../../../config/master_colors.dart';
import '../../../core/constant/dimesions.dart';

class BookVarticalListItem extends StatelessWidget {
  const BookVarticalListItem({
    Key? key,
    required this.book,
  }) : super(key: key);
  final Book book;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final BookDetailsIntentHolder holder =
            BookDetailsIntentHolder(id: book.id ?? "");
        Navigator.pushNamed(context, RoutePaths.bookDetails, arguments: holder);
      },
      child: Container(
        decoration: BoxDecoration(
            color: MasterColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
                imageUrl: book.image ?? '',
                fit: BoxFit.fill,
                height: Dimesion.height40 * 4,
                width: double.infinity,
                placeholder: (context, url) => const CustomShimmer(),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/noimg.png'),
                imageBuilder: (context, img) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimesion.radius15 / 2),
                            topRight: Radius.circular(Dimesion.radius15 / 2)),
                        image: DecorationImage(image: img, fit: BoxFit.cover)),
                  );
                }),
            Container(
                margin: EdgeInsets.only(
                    top: Dimesion.height10, left: Dimesion.height10),
                alignment: Alignment.center,
                width: Dimesion.height100,
                child: Text(
                  book.title ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(),
                )),
          ],
        ),
      ),
    );
  }
}
