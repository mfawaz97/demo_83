import 'package:demo_83/ui/style/theme.dart';
import 'package:demo_83/util/injectables/injectable.variables.dart';
import 'package:demo_83/util/injectables/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputTextField extends StatefulWidget {
  final Function validator;
  final Function(String?)? onSave;
  final Function()? onTap;
  final int? inputMaxLength;
  final String? initialText;
  final String? hintText;
  final TextInputType textInputType;
  final Widget? icon;
  final Widget? suffexIcon;
  final bool obscure;
  final bool autoFoucs;
  final bool removeFillColor;
  final String? label;
  final String? prefixLabel;
  final int maxLines;
  final int minLines;
  final bool isCollapes;
  final bool? enabled;
  final TextAlign textAlign;
  final Function(String)? onFieldSubmit;
  final Function? onChange;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Color? color;
  final bool showUnderline;
  final List<String>? autofillHints;

  const CustomInputTextField({
    Key? key,
    required this.validator,
    this.onTap,
    this.inputMaxLength,
    this.hintText,
    this.initialText,
    this.textInputType = TextInputType.text,
    this.obscure = false,
    this.autoFoucs = false,
    this.onSave,
    this.icon,
    this.label,
    this.maxLines = 1,
    this.minLines = 1,
    this.isCollapes = false,
    this.textAlign = TextAlign.start,
    this.controller,
    this.onFieldSubmit,
    this.focusNode,
    this.textInputAction,
    this.removeFillColor = false,
    this.prefixLabel,
    this.onChange,
    this.enabled,
    this.color,
    this.showUnderline = false,
    this.autofillHints,
    this.suffexIcon,
  }) : super(key: key);

  @override
  CustomInputTextFieldState createState() => CustomInputTextFieldState();
}

class CustomInputTextFieldState extends State<CustomInputTextField> {
  late TextDirection textDirection;
  late TextEditingController textEditingController;
  final RegExp _regExp = RegExp(r"^[a-zA-Z0-9_+\-=@,\.;'`~^%&\*\[\]\{\}.!#|\\\$',:;=/\(\),\-?]*$");

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: widget.initialText ?? "");
    textDirection = getIt<InjectableVariables>().locale.languageCode == "ar" ? TextDirection.rtl : TextDirection.ltr;
  }

  String lastValue = "";
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled ?? true,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmit,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      controller: widget.controller ?? textEditingController,
      style: Theme.of(context).textTheme.headline5?.copyWith(decoration: TextDecoration.none),
      textAlignVertical: TextAlignVertical.center,
      maxLines: widget.maxLines,
      autofocus: widget.autoFoucs,
      minLines: widget.minLines,
      autofillHints: widget.autofillHints,
      onChanged: (value) {
        if (value.length == 1) {
          if (_regExp.hasMatch(value.characters.first)) {
            setState(() {
              textDirection = TextDirection.ltr;
            });
          } else if (value.trim().isNotEmpty) {
            setState(() {
              textDirection = TextDirection.rtl;
            });
          }
        }
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      textDirection: textDirection,
      obscureText: widget.obscure,
      onTap: widget.onTap,
      keyboardType: widget.textInputType,
      inputFormatters: [
        LengthLimitingTextInputFormatter(widget.inputMaxLength),
      ],
      textAlign: widget.textAlign,
      validator: (value) {
        return widget.validator(value);
      },
      onSaved: widget.onSave,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        suffixIcon: widget.suffexIcon,
        hintStyle: Theme.of(context).textTheme.headline5?.copyWith(height: 2),
        prefixIconConstraints: const BoxConstraints(maxHeight: 20, maxWidth: 40),
        prefix: Text(
          widget.prefixLabel ?? "",
          style: Theme.of(context).textTheme.headline5?.copyWith(height: 2),
        ),
        filled: true,
        enabledBorder: widget.showUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFFA9A9A9).withOpacity(0.2),
                ),
              )
            : InputBorder.none,
        border: widget.showUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFFA9A9A9).withOpacity(0.2),
                ),
              )
            : InputBorder.none,
        focusedBorder: widget.showUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: widget.controller != null && widget.controller!.text.isNotEmpty
                      ? Theme.of(context).primaryColorDark.withOpacity(0.6)
                      : textEditingController.text.isNotEmpty
                          ? Theme.of(context).primaryColorDark.withOpacity(0.6)
                          : const Color(0xFFA9A9A9).withOpacity(0.6),
                ),
              )
            : InputBorder.none,
        errorBorder: widget.showUnderline
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 0.4),
              )
            : InputBorder.none,
        disabledBorder: widget.showUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFFA9A9A9).withOpacity(0.2),
                ),
              )
            : InputBorder.none,
        fillColor: widget.removeFillColor ? Colors.transparent : widget.color ?? Theme.of(context).primaryColorLight,
        hintText: widget.hintText,
        labelText: widget.label,
        labelStyle: Theme.of(context).textTheme.headline2?.copyWith(
              color: ownTheme(context).textColorAlt2,
            ),
      ),
    );
  }
}
