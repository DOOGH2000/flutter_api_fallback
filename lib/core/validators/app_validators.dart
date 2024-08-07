import 'package:easy_localization/easy_localization.dart';

class AppValidators {
  static String? email(String? email) {
    if (email == null || email.isEmpty) {
      return 'Validators.EmailRequired'.tr();
    }
    if (!email.contains('@')) {
      return 'Validators.EmailPattern'.tr();
    }
    //make sure there are strings before and after the @
    final split = email.split('@');
    if (split.length != 2 || split.contains('')) {
      return 'Validators.EmailPattern'.tr();
    }
    return null;
  }

  static String? password(String? password) {
    if (password == null || password.isEmpty) {
      return 'Validators.PasswordRequired'.tr();
    }
    if (password.length < 6) {
      return 'Validators.PasswordMinLength'.tr();
    }
    //contains at least one number, one uppercase letter, and one special character

    // if (!password.contains(RegExp('[0-9]'))) {
    //   return 'Validators.PasswordContainNumber'.tr();
    // }
    // if (!password.contains(RegExp('[A-Z]'))) {
    //   return 'Validators.PasswordContainUpperCase'.tr();
    // }
    // if (!password
    //     .contains(RegExp(r'[!@#$%^&*()_+\-=\[\]{};:"|,.<>\/?' "'" ']'))) {
    //   return 'Validators.PasswordContainSpecialChar'.tr();
    // }
    return null;
  }

  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Validators.Required'.tr();
    }

    return null;
  }

  static String? numbersExactLength(String? value, int length) {
    if (value == null || value.isEmpty) {
      return 'Validators.Required'.tr();
    }

    if (value.length != length) {
      return '${'Validators.ExactLength'.tr()}$length';
    }

    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Validators.Required'.tr();
    }

    if (!value.contains(RegExp('^[0-9]*\$')) || value[0] != '0') {
      return 'Validators.PhonePattern'.tr();
    }

    if (value.length != 11) {
      return '${'Validators.ExactLength'.tr()}11';
    }

    return null;
  }

  static String? identical(String? value, String? other) {
    if (value == null || value.isEmpty) {
      return 'Validators.Required'.tr();
    }

    if (value != other) {
      return 'Validators.Identical'.tr();
    }

    return null;
  }

  static String? otp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter OTP Code';
    }

    return null;
  }
}
