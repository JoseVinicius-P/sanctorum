import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sanctorum_flutter/app/shared/my_text_styles.dart';
import 'package:sanctorum_flutter/app/shared/utilities/my_colors.dart';
import 'package:sanctorum_flutter/app/shared/utilities/my_icons.dart';

class DefaultAlertDialogWidget extends StatefulWidget {
  const DefaultAlertDialogWidget({
    super.key,
    required this.title,
    required this.content,
    this.onPressedSave,
    String? finishButtonText,
    bool? canFullScreen,
    this.obs,
    EdgeInsets? contentPadding,
  }) : finishButtonText = finishButtonText ?? 'Salvar',
    canFullScreen = canFullScreen ?? true,
    contentPadding = contentPadding ?? const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 24);

  final String title;
  final Widget content;
  final FutureOr<bool> Function()? onPressedSave;
  final String finishButtonText;
  final bool canFullScreen;
  final String? obs;
  final EdgeInsets contentPadding;

  @override
  State<DefaultAlertDialogWidget> createState() => _DefaultAlertDialogWidgetState();
}

class _DefaultAlertDialogWidgetState extends State<DefaultAlertDialogWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var titlePadding = const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5);
    var title = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(child: Text(widget.title, style: MyTextStyles.title5,)),
        IconButton(
            onPressed: isLoading ? null : () => Navigator.pop(context),
            icon: Icon(MyIcons.close, color: MyColors.textColor.withOpacity(0.5),)
        )
      ],
    );
    var content = Stack(
      children: [
        widget.content,
        Visibility(
            visible: isLoading,
            child: Positioned.fill(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            )
        ),
      ],
    );
    var actions = [
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if(widget.obs != null)
            Text(widget.obs!, style: MyTextStyles.defaultText.copyWith(color: MyColors.grey),),
          const Spacer(),
          TextButton(
              onPressed: isLoading ? null : () {
                FocusScope.of(context).unfocus();
                Navigator.pop(context);
              },
              child: Text(
                "Cancelar",
                style: MyTextStyles.defaultText.copyWith(color: MyColors.primaryColor),
              )
          ),
          TextButton(
              onPressed: isLoading ? null : () async {
                FocusScope.of(context).unfocus();
                setState(() {
                  isLoading = true;
                });
                bool? isRegistered = await widget.onPressedSave?.call();
                setState(() {
                  isLoading = false;
                });
                if(isRegistered ?? false){
                  Navigator.pop(context);
                }
              },
              child: Text(
                widget.finishButtonText,
                style: MyTextStyles.defaultText.copyWith(color: MyColors.primaryColor),
              )
          ),
        ],
      ),
    ];
    return AlertDialog(
      contentPadding: widget.contentPadding,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      titlePadding: titlePadding,
      title: title,
      content: content,
      actions: actions,
    );
  }
}