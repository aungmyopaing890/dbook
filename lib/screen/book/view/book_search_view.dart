import 'package:dbook/core/provider/book/book_search_provider.dart';
import 'package:dbook/core/repository/book_repository.dart';
import 'package:dbook/screen/book/widgets/book_vertical_list.dart';
import 'package:dbook/screen/common/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../config/master_colors.dart';
import '../../../../core/constant/dimesions.dart';
import '../../common/textfields/search_textfield.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({
    super.key,
  });
  @override
  State<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  TextEditingController searchController = TextEditingController();
  late BookSearchProvider searchProvider;

  @override
  Widget build(BuildContext context) {
    final BookRepository repository = Provider.of<BookRepository>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookSearchProvider>(
            lazy: false,
            create: (BuildContext context) {
              searchProvider = BookSearchProvider(repository: repository);
              return searchProvider;
            }),
      ],
      child: Scaffold(
        backgroundColor: MasterColors.grey,
        appBar: AppbarWidget(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: MasterColors.black,
              size: Dimesion.height24,
            ),
          ),
          appBarTitle: "Book Search",
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimesion.width10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SearchTextFieldWidget(
                    searchController: searchController,
                    hintText: 'Search Books',
                    search: () {
                      searchProvider.loadDataList(searchController.text);
                    }),
                const BookVerticalList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}