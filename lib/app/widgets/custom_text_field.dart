import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style/app_colors.dart';
import '../style/app_text_styles.dart';
import 'custom_text_field_suffix.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    Key? key,
    this.hintText,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.prefix,
    this.controller,
    this.suffix,
    this.onPressed,
    this.obscureText = false,
    this.readOnly = false,
    this.withBorder = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    this.onFieldSubmitted,
    this.mandatory = false,
    this.headerText,
    this.fillColor,
    this.focusNode,
    this.hintStyleColor,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.sentences,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 16,
    ),
    this.margin = const EdgeInsets.only(bottom: 16),
    this.validator,
  }) : super(key: key);

  final void Function(String value)? onChanged;
  final Function(String? value)? onFieldSubmitted;
  final EdgeInsets contentPadding;
  final EdgeInsets margin;
  final TextEditingController? controller;
  final Color? fillColor;
  final FocusNode? focusNode;
  final String? headerText;
  final Color? hintStyleColor;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final bool mandatory;
  final bool obscureText;
  final VoidCallback? onPressed;
  final int? maxLines;
  final Widget? prefix;
  final bool readOnly;
  final Widget? suffix;
  final TextCapitalization textCapitalization;
  final bool withBorder;
  final BorderRadius borderRadius;
  final String? Function(String? value)? validator;

  @override
  CustomTextFieldWidgetState createState() => CustomTextFieldWidgetState();
}

class CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  late bool _obscureText;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.headerText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.headerText,
                      style: AppTextStyle.bold20(context)?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    if (widget.mandatory)
                      TextSpan(
                        text: ' *',
                        style: AppTextStyle.regular14(context)?.copyWith(
                          color: AppColors.redError,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          TextFormField(
            cursorColor: AppColors.black,
            maxLines: widget.maxLines,
            onTap: widget.onPressed,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            obscureText: _obscureText,
            enableSuggestions: !widget.obscureText,
            autocorrect: !widget.obscureText,
            readOnly: widget.readOnly,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            textCapitalization: widget.textCapitalization,
            decoration: InputDecoration(
              filled: true,
              contentPadding: widget.contentPadding,
              fillColor: widget.fillColor ?? AppColors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius,
                borderSide: widget.withBorder
                    ? const BorderSide(color: AppColors.gray)
                    : BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius,
                borderSide: widget.withBorder
                    ? const BorderSide(color: AppColors.gray)
                    : BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  16,
                ),
                borderSide: widget.withBorder
                    ? const BorderSide(color: AppColors.gray)
                    : BorderSide.none,
              ),
              suffixIcon: widget.suffix ??
                  (widget.obscureText
                      ? CustomTextFieldIconWidget(
                          icon: Icon(
                            _obscureText
                                ? const IconData(
                                    0xe909,
                                    fontFamily: 'AppIcons',
                                  )
                                : const IconData(0xe907,
                                    fontFamily: 'AppIcons'),
                            color: _obscureText
                                ? AppColors.white
                                : AppColors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )
                      : null),
              prefixIcon: widget.prefix,
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: widget.hintStyleColor ?? AppColors.grayStroke,
                    fontSize: 14,
                  ),
            ),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: AppColors.black,
                  fontSize: 16,
                ),
            onChanged: widget.onChanged,
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
