import 'package:flutter/material.dart';

import '../../../config/master_colors.dart';
import '../../../core/constant/dimesions.dart';

class MasterTextFieldWidget extends StatelessWidget {
  const MasterTextFieldWidget({
    super.key,
    this.textEditingController,
    this.hintText,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController? textEditingController;
  final String? hintText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: Dimesion.height10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimesion.radius15)),
      color: MasterColors.cardBackgroundColor,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimesion.height10,
        ),
        child: TextFormField(
          keyboardType: keyboardType,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          controller: textEditingController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: Dimesion.font12,
                color: Colors.grey.shade500),
          ),
        ),
      ),
    );
  }
}

class MasterPasswordTextFieldWidget extends StatefulWidget {
  const MasterPasswordTextFieldWidget({
    super.key,
    this.textEditingController,
    this.hintText,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController? textEditingController;
  final String? hintText;
  final TextInputType keyboardType;

  @override
  State<MasterPasswordTextFieldWidget> createState() =>
      _MasterPasswordTextFieldWidgetState();
}

class _MasterPasswordTextFieldWidgetState
    extends State<MasterPasswordTextFieldWidget> {
  bool _passwordVisible = false;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: Dimesion.height10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimesion.radius15)),
      color: MasterColors.cardBackgroundColor,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.only(left: Dimesion.height10),
        child: TextFormField(
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          obscureText: !_passwordVisible,
          controller: widget.textEditingController,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: Dimesion.font12,
                  color: Colors.grey.shade500),
              suffixIcon: GestureDetector(
                onTap: () => setState(() {
                  _passwordVisible = !_passwordVisible;
                }),
                child: Icon(
                  _passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off_rounded,
                  color: MasterColors.buttonColor,
                ),
              )),
        ),
      ),
    );
  }
}
