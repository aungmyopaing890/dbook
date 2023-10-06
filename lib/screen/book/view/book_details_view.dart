import 'package:cached_network_image/cached_network_image.dart';
import 'package:dbook/core/provider/book/book_detail_provider.dart';
import 'package:dbook/core/provider/book/book_favourite_provider.dart';
import 'package:dbook/core/repository/book_repository.dart';
import 'package:dbook/core/viewobject/book.dart';
import 'package:dbook/screen/common/app_bar_widget.dart';
import 'package:dbook/screen/common/customshimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../config/master_colors.dart';
import '../../../../core/constant/dimesions.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.id});
  final String id;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  late BookDetailProvider detailProvider;
  late BookFavouriteProvider favouriteProvider;
  @override
  Widget build(BuildContext context) {
    final BookRepository repository = Provider.of<BookRepository>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookDetailProvider>(
            lazy: false,
            create: (BuildContext context) {
              detailProvider = BookDetailProvider(repository: repository);
              detailProvider.loadData(widget.id);
              return detailProvider;
            }),
        ChangeNotifierProvider<BookFavouriteProvider>(
            lazy: false,
            create: (BuildContext context) {
              favouriteProvider = BookFavouriteProvider(repository: repository);
              favouriteProvider.checkfavBook(id: widget.id);
              return favouriteProvider;
            }),
      ],
      child: Scaffold(
        backgroundColor: MasterColors.appBackgorundColor,
        appBar: AppbarWidget(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: MasterColors.black,
              size: Dimesion.height24,
            ),
          ),
          appBarTitle: "Book Details",
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimesion.width20, vertical: Dimesion.width10),
              child: Consumer<BookDetailProvider>(builder:
                  (BuildContext context, BookDetailProvider pro,
                      Widget? child) {
                Book book = pro.data ?? Book();
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    pro.isLoading
                        ? SizedBox(
                            height: Dimesion.screeHigh * 0.5,
                            width: Dimesion.screenWidth * 0.9,
                            child: const CustomShimmer())
                        : CachedNetworkImage(
                            imageUrl: book.image ?? "",
                            fit: BoxFit.contain,
                            height: Dimesion.screeHigh * 0.5,
                            width: Dimesion.screenWidth * 0.9,
                            placeholder: (context, url) =>
                                const CustomShimmer(),
                            errorWidget: (context, url, error) =>
                                Image.asset('assets/images/noimg.png'),
                            imageBuilder: (context, img) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: Dimesion.width20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimesion.radius15 / 2),
                                    image: DecorationImage(
                                        image: img, fit: BoxFit.fill)),
                              );
                            }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: Dimesion.height10),
                            height: Dimesion.height50,
                            width: Dimesion.screenWidth * 0.7,
                            child: pro.isLoading
                                ? const CustomShimmer()
                                : Text(
                                    'Name : ${book.title}',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          color: MasterColors.black,
                                        ),
                                  )),
                        Consumer<BookFavouriteProvider>(builder:
                            (BuildContext context,
                                BookFavouriteProvider favouriteProvider,
                                Widget? child) {
                          return InkWell(
                              onTap: () async {
                                setState(() {
                                  favouriteProvider.isFav =
                                      !favouriteProvider.isFav;
                                  book.isFavourite = !book.isFavourite;
                                });
                                await favouriteProvider.favBook(book: book);
                              },
                              child: Container(
                                  margin:
                                      EdgeInsets.only(top: Dimesion.height10),
                                  child: favouriteProvider.isFav
                                      ? Icon(
                                          Icons.favorite,
                                          color: MasterColors.red,
                                          size: Dimesion.iconSize32,
                                        )
                                      : Icon(
                                          Icons.favorite_outline,
                                          color: MasterColors.red,
                                          size: Dimesion.iconSize32,
                                        )));
                        })
                      ],
                    ),
                    SizedBox(
                      height: Dimesion.height10,
                    ),
                    const Divider(
                      color: Colors.black26,
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BookDetailsHorizontalTitleAndTextStringWidget(
                          isLoading: pro.isLoading,
                          title: 'Year : ',
                          text: book.year ?? "",
                        ),
                        BookDetailsHorizontalTitleAndTextStringWidget(
                          isLoading: pro.isLoading,
                          title: 'Pages : ',
                          text: book.pages ?? "",
                        ),
                      ],
                    ),
                    BookDetailsHorizontalTitleAndTextStringWidget(
                      isLoading: pro.isLoading,
                      title: 'Publisher : ',
                      text: book.publisher ?? "",
                    ),
                    const Divider(
                      color: Colors.black26,
                      height: 1,
                    ),
                    BookDetailsVerticalTitleAndTextStringWidget(
                      isLoading: pro.isLoading,
                      title: 'Authors',
                      text: book.authors ?? "",
                    ),
                    BookDetailsVerticalTitleAndTextStringWidget(
                      isLoading: pro.isLoading,
                      title: 'Description',
                      text: book.description ?? "",
                    ),
                  ],
                );
              }),
            )),
      ),
    );
  }
}

class BookDetailsVerticalTitleAndTextStringWidget extends StatelessWidget {
  const BookDetailsVerticalTitleAndTextStringWidget({
    Key? key,
    required this.isLoading,
    required this.title,
    required this.text,
  }) : super(key: key);
  final bool isLoading;
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: Dimesion.height10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: MasterColors.black, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        isLoading
            ? Container(
                height: Dimesion.height40,
                margin: EdgeInsets.symmetric(vertical: Dimesion.height10),
                child: const CustomShimmer())
            : Container(
                margin: EdgeInsets.symmetric(vertical: Dimesion.height10),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: MasterColors.black, fontWeight: FontWeight.w400),
                ),
              ),
      ],
    );
  }
}

class BookDetailsHorizontalTitleAndTextStringWidget extends StatelessWidget {
  const BookDetailsHorizontalTitleAndTextStringWidget({
    Key? key,
    required this.isLoading,
    required this.title,
    required this.text,
  }) : super(key: key);
  final bool isLoading;
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: Dimesion.height10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: MasterColors.black, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        isLoading
            ? Container(
                height: Dimesion.height40,
                margin: EdgeInsets.symmetric(vertical: Dimesion.height10),
                child: const CustomShimmer())
            : Container(
                margin: EdgeInsets.symmetric(vertical: Dimesion.height10),
                child: Text(
                  text,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: MasterColors.black, fontWeight: FontWeight.w400),
                ),
              ),
      ],
    );
  }
}
