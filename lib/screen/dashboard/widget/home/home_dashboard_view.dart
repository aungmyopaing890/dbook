import 'package:dbook/config/master_colors.dart';
import 'package:dbook/config/route/route_paths.dart';
import 'package:dbook/screen/book/widgets/book_vertical_list.dart';
import 'package:flutter/material.dart';
import 'package:dbook/screen/dashboard/widget/home/widgets/home_search_header.dart';
import 'package:provider/provider.dart';
import '../../../../core/constant/dimesions.dart';
import '../../../../core/provider/book/book_provider.dart';
import '../../../../core/repository/book_repository.dart';

class HomeDashboardViewWidget extends StatefulWidget {
  const HomeDashboardViewWidget({super.key});

  @override
  State<HomeDashboardViewWidget> createState() =>
      _HomeDashboardViewWidgetState();
}

class _HomeDashboardViewWidgetState extends State<HomeDashboardViewWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final BookRepository bannerRepository =
        Provider.of<BookRepository>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookProvider>(
            lazy: false,
            create: (BuildContext context) {
              BookProvider bookProvider =
                  BookProvider(repository: bannerRepository);
              bookProvider.loadDataList();
              return bookProvider;
            }),
      ],
      child: Scaffold(
        backgroundColor: MasterColors.appBackgorundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimesion.width10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimesion.height20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimesion.height10),
                  child: SearchHeaderWidget(
                    searchController: searchController,
                    hintText: 'Search Books ....',
                    routeFunc: () {
                      Navigator.pushNamed(
                        context,
                        RoutePaths.searchBook,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: Dimesion.height20,
                ),
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
                Consumer<BookProvider>(builder:
                    (BuildContext context, BookProvider pro, Widget? child) {
                  return BookVerticalList(
                      dataLength: pro.datalength,
                      dataList: pro.isLoading ? [] : pro.data.data,
                      hasData: pro.hasData,
                      refresh: () {},
                      isLoading: pro.isLoading);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
