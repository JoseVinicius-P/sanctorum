import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sanctorum_flutter/app/shared/my_text_styles.dart';
import 'package:sanctorum_flutter/app/shared/utilities/my_colors.dart';
import 'package:sanctorum_flutter/app/shared/utilities/my_icons.dart';
import 'package:sanctorum_flutter/app/shared/utilities/my_masks.dart';
import 'package:sanctorum_flutter/app/shared/utilities/validator.dart';

class TextFieldWidget extends StatefulWidget {
  final String? hint;
  final String? text;
  final bool? enable;
  final String? error;
  final MaskTextInputFormatter? maskFormatter;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onPressedSuffixIcon;
  final bool? isVerticalDense;
  final Validator? validator;
  final bool? selectTextWithTap;
  final Function? onTap;
  final bool isUpperCase;
  final bool enableBorder;
  final EdgeInsets padding;

  const TextFieldWidget({
    super.key,
    this.hint,
    this.maskFormatter,
    this.enable,
    this.prefixIcon,
    this.keyboardType,
    this.maxLength,
    this.controller,
    this.error,
    this.onChanged,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.onPressedSuffixIcon,
    this.text,
    this.isVerticalDense,
    this.validator,
    bool? selectTextWithTap,
    bool? isUpperCase,
    this.onTap,
    bool? enableBorder,
    EdgeInsets? padding,
  }) : selectTextWithTap = selectTextWithTap ?? false,
  isUpperCase = isUpperCase ?? false,
  enableBorder = enableBorder ?? true,
  padding = padding ?? const EdgeInsets.symmetric(vertical: 20.0, horizontal: 17.0);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode _focusNode;
  late TextEditingController controller;
  String text = "";
  late bool isPassword;
  bool obscureText = true;
  String? error;

  void initFocus(){
    if(widget.focusNode != null){
      _focusNode = widget.focusNode!;
    }else{
      _focusNode = FocusNode();
    }

    _focusNode.addListener(() {
      setState(() {});
      if(!_focusNode.hasFocus){
        error = widget.validator?.validate.call(controller.text.trim());
      }
    });
  }

  void removeError(){
    if(error != null){
      setState(() {
        error = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    initFocus();

    isPassword = widget.keyboardType == TextInputType.visiblePassword;
    obscureText = isPassword;

    controller.text = widget.text ?? "";
    text = widget.text ?? "";
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Importante descartar o FocusNode ao final
    super.dispose();
  }

  Color getColor(){
    if(error != null){
      return MyColors.errorColor;
    }else if(_focusNode.hasFocus){
      return MyColors.primaryColor;
    }else if(text.isEmpty){
      return MyColors.grey;
    }else{
      return MyColors.textColor;
    }
  }

  @override
  void didUpdateWidget(covariant TextFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text && widget.text != text) {
      controller.text = widget.text ?? '';
      setState(() {
        text = widget.text ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(widget.error != null && widget.error!.isNotEmpty){
      error = widget.error;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onTap: (){
            if(widget.selectTextWithTap! && text == widget.text){
              controller.selection = TextSelection(baseOffset: 0, extentOffset: text.length);
            }
            widget.onTap?.call();
          },
          controller: controller,
          textInputAction: widget.textInputAction,
          maxLengthEnforcement: MaxLengthEnforcement.none,
          enabled: widget.enable,
          inputFormatters: widget.maskFormatter != null ?
          [
            widget.maskFormatter!,
            if(widget.isUpperCase)
              UpperCaseTextFormatter(),
            LengthLimitingTextInputFormatter(widget.maxLength),
          ] :
          [
            if(widget.isUpperCase)
              UpperCaseTextFormatter(),
            LengthLimitingTextInputFormatter(widget.maxLength)
          ],
          keyboardType: widget.keyboardType,
          onChanged: (text){
            removeError();
            text = text.trim();
            setState(() {
              this.text = text;
            });
            widget.onChanged?.call(text);
          },
          obscureText: obscureText,
          focusNode: _focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          //definindo estilo do texto
          style: MyTextStyles.defaultText.copyWith(color: getColor()),
          cursorColor: getColor(),
          //retirando autocorreção de texto
          autocorrect: false,
          //definindo estilo do container do textfield
          decoration: InputDecoration(
            contentPadding: widget.padding,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.enableBorder ? getColor() : Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.enableBorder ? getColor() : Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.enableBorder ? MyColors.grey : Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            fillColor: Colors.transparent,
            //Definindo hint usando varivel da classe personalizada MyStrings
            labelText: widget.hint,
            floatingLabelStyle: MyTextStyles.defaultText.copyWith(color: getColor()),
            labelStyle: MyTextStyles.defaultText.copyWith(color: getColor()),
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, color: getColor()) : null,
            suffixIcon: isPassword ? IconButton(
              onPressed: isPassword ? (){
                setState(() {
                  obscureText = !obscureText;
                });
              } : null,
              icon: Icon(obscureText ? MyIcons.visibilityOff : MyIcons.visibility, color: isPassword ? getColor() : Colors.transparent),
            ) :
            widget.suffixIcon != null ?
              IconButton(
                onPressed: widget.onPressedSuffixIcon,
                icon: Icon(widget.suffixIcon, color: getColor(),),
              ) : null,
            filled: false,
          ),
        ),
        if(!(widget.isVerticalDense ?? false))
        const SizedBox(height: 5,),
        if(!(widget.isVerticalDense ?? false))
        Text(
        error != null && error != "" ? "     *$error" : "",
          style: const TextStyle(
            fontSize: 12,
            color: MyColors.errorColor
          ),
        ),
        if(!(widget.isVerticalDense ?? false))
        const SizedBox(height: 8,),
      ],
    );
  }
}