import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle? bold32(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w700,
        );
  }

  static TextStyle? bold24(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        );
  }

  static TextStyle? bold20(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        );
  }

  static TextStyle? bold18(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        );
  }

  static TextStyle? semiBold16(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );
  }

  static TextStyle? medium18(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        );
  }

  static TextStyle? medium16(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        );
  }

  static TextStyle? medium14(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        );
  }

  static TextStyle? medium12(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        );
  }

  static TextStyle? regular16(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        );
  }

  static TextStyle? regular14(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        );
  }

  static TextStyle? regular12(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        );
  }

  static TextStyle? regular10(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        );
  }
}
