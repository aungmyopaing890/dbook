import 'package:dbook/config/master_colors.dart';
import 'package:dbook/core/provider/book/book_favourite_provider.dart';
import 'package:dbook/screen/book/widgets/book_vertical_list.dart';
import 'package:dbook/screen/common/empty_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constant/dimesions.dart';
import '../../../../core/repository/book_repository.dart';

class FavouriteBooksViewWidget extends StatefulWidget {
  const FavouriteBooksViewWidget({super.key});

  @override
  State<FavouriteBooksViewWidget> createState() =>
      _FavouriteBooksViewWidgetState();
}

class _FavouriteBooksViewWidgetState extends State<FavouriteBooksViewWidget> {
  TextEditingController searchController = TextEditingController();
  late BookFavouriteProvider bookProvider;

  @override
  Widget build(BuildContext context) {
    final BookRepository repository = Provider.of<BookRepository>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookFavouriteProvider>(
            lazy: false,
            create: (BuildContext context) {
              bookProvider = BookFavouriteProvider(repository: repository);
              bookProvider.loadDataList();
              return bookProvider;
            }),
      ],
      child: Scaffold(
        backgroundColor: MasterColors.appBackgorundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimesion.width10),
          child: RefreshIndicator(
            onRefresh: () async {
              bookProvider.loadDataList();
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimesion.height20,
                  ),
                  Consumer<BookFavouriteProvider>(
                      builder: (BuildContext context, BookFavouriteProvider pro,
                              Widget? child) =>
                          pro.hasData
                              ? BookVerticalList(
                                  dataLength: pro.datalength,
                                  dataList: pro.isLoading ? [] : pro.dataList,
                                  hasData: pro.hasData,
                                  refresh: () {
                                    pro.loadDataList();
                                  },
                                  isLoading: pro.isLoading)
                              : const EmptyBoxWidget(
                                  message:
                                      "There is no Books in your wishlist!"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
