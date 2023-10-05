import 'package:flutter/material.dart';
import '../../../config/master_colors.dart';
import '../../../core/constant/dimesions.dart';
import '../../../core/utils/utils.dart';
import '../button_widget_with_round_corner.dart';

class ErrorDialog extends StatefulWidget {
  const ErrorDialog({super.key, this.message});
  final String? message;
  @override
  State<ErrorDialog> createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
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

  final ErrorDialog widget;

  @override
  Widget build(BuildContext context) {
    final Widget headerWidget = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              const Icon(
                Icons.error_outline,
                // color: MasterColors.adInRejectColor,
              ),
              SizedBox(
                width: Dimesion.height12,
              ),
              Text(
                'Error',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Utils.isLightMode(context)
                        ? MasterColors.secondary800
                        : MasterColors.primaryDarkWhite,
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
              color: Utils.isLightMode(context)
                  ? MasterColors.secondary800
                  : MasterColors.primaryDarkWhite,
            ))
      ],
    );
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
            padding: EdgeInsets.all(Dimesion.height16),
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
                        fontWeight: FontWeight.w400, color: MasterColors.black),
                  ),
                ),
                ButtonWidgetRoundCorner(
                    colorData: MasterColors.buttonColor,
                    hasShadow: false,
                    width: MediaQuery.of(context).size.width,
                    height: Dimesion.height40,
                    titleText: 'ok',
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            )));
  }
}
