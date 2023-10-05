import 'package:flutter/material.dart';
import '../../../../../config/master_colors.dart';
import '../../../../../core/constant/dimesions.dart';

class SearchHeaderWidget extends StatelessWidget {
  const SearchHeaderWidget(
      {super.key,
      required this.searchController,
      required this.routeFunc,
      this.hintText = 'Search Anythings...'});

  final TextEditingController searchController;
  final Function routeFunc;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: MasterColors.white,
          borderRadius: BorderRadius.circular(Dimesion.height15)),
      padding: EdgeInsets.symmetric(
        horizontal: Dimesion.height5,
      ),
      child: TextField(
          readOnly: true,
          autofocus: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          maxLines: null,
          controller: searchController,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: MasterColors.black),
          decoration: InputDecoration(
            fillColor: MasterColors.white,
            contentPadding: EdgeInsets.all(Dimesion.height10),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.black38),
            suffixIcon: InkWell(
                child: Icon(
                  Icons.search,
                  color: MasterColors.mainColor,
                ),
                onTap: () => routeFunc()),
          ),
          onTap: () => routeFunc()),
    );
  }
}
