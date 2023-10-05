import 'package:flutter/material.dart';

import '../../../../../config/master_colors.dart';
import '../../../../../core/constant/dimesions.dart';
import '../../../core/utils/utils.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget(
      {super.key,
      required this.searchController,
      required this.hintText,
      required this.search});

  final TextEditingController searchController;
  final String hintText;
  final Function search;

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  final debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: MasterColors.white,
          borderRadius: BorderRadius.circular(Dimesion.height8)),
      margin: EdgeInsets.symmetric(
          horizontal: Dimesion.height10, vertical: Dimesion.height10),
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.text,
        maxLines: 1,
        controller: widget.searchController,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        onChanged: (value) {
          debouncer.run(() {
            if (widget.searchController.text != '') {
              widget.search();
            }
          });
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(Dimesion.height10),
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Colors.black38),
          suffixIcon: InkWell(
              child: Icon(
                Icons.search,
                color: MasterColors.black,
              ),
              onTap: () {
                if (widget.searchController.text != '') {
                  widget.search();
                }
              }),
        ),
      ),
    );
  }
}
