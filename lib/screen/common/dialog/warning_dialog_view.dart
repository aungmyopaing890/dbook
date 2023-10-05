import 'package:flutter/material.dart';

import '../../../config/master_colors.dart';
import '../../../core/constant/dimesions.dart';
import '../button_widget_with_round_corner.dart';

class WarningDialog extends StatefulWidget {
  const WarningDialog(
      {super.key, this.message, this.onPressed, this.titleText});

  final String? message;
  final Function? onPressed;
  final String? titleText;

  @override
  State<WarningDialog> createState() => _WarningDialogState();
}

class _WarningDialogState extends State<WarningDialog> {
  @override
  Widget build(BuildContext context) {
    return _NewDialog(widget: widget);
  }
}

class _NewDialog extends StatelessWidget {
  const _NewDialog({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final WarningDialog widget;

  @override
  Widget build(BuildContext context) {
    final Widget headerWidget = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              const Icon(
                Icons.warning_amber_outlined,
                // color: MasterColors.warningColor,
              ),
              SizedBox(
                width: Dimesion.height12,
              ),
              Text(
                widget.titleText ?? 'Warning',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: MasterColors.warningColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: MasterColors.black,
            ))
      ],
    );
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
            padding: EdgeInsets.all(Dimesion.height16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  headerWidget,
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimesion.height16, bottom: Dimesion.height24),
                    child: Text(
                      widget.message!,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: MasterColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                  ButtonWidgetRoundCorner(
                      colorData: MasterColors.black,
                      hasShadow: false,
                      width: MediaQuery.of(context).size.width,
                      height: Dimesion.height40,
                      titleText: 'Ok',
                      titleTextColor: MasterColors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                        widget.onPressed!();
                      }),
                ],
              ),
            )));
  }
}
