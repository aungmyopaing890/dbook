import 'package:flutter/material.dart';
import '../../../../config/master_colors.dart';
import '../../../../core/constant/dimesions.dart';
import '../../../../core/viewobject/category.dart';

class SelectCategoryWidget extends StatefulWidget {
  const SelectCategoryWidget({
    super.key,
    required this.categoryList,
    required this.selectedCategory,
    required this.fun,
  });

  final List<Category> categoryList;
  final TextEditingController selectedCategory;

  final Function fun;
  @override
  State<SelectCategoryWidget> createState() => _SelectCategoryWidgetState();
}

class _SelectCategoryWidgetState extends State<SelectCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimesion.height10),
      padding: EdgeInsets.symmetric(horizontal: Dimesion.height20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimesion.width5),
            child: Text(
              "Select Category",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.normal,
                    fontSize: Dimesion.font12,
                  ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Dimesion.height10),
            decoration: BoxDecoration(
                color: MasterColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0.1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.symmetric(horizontal: Dimesion.width20),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    readOnly: true,
                    autofocus: false,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 10),
                        hintText: widget.selectedCategory.text,
                        hintStyle:
                            Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: MasterColors.black,
                                ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                DropdownButton(
                  icon: Icon(
                    Icons.keyboard_arrow_up,
                    size: Dimesion.iconSize16 + 5,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: MasterColors.black,
                      ),
                  items: widget.categoryList
                      .map<DropdownMenuItem<Category>>((value) {
                    return DropdownMenuItem<Category>(
                      value: value,
                      child: Text(
                        value.title.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  underline: Container(height: 0),
                  onChanged: (Category? newValue) {
                    setState(() {
                      widget.selectedCategory.text = newValue!.title.toString();
                      widget.fun(newValue);
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
