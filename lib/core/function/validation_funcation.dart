import 'package:hosptel_app/core/resources/validation_manger.dart';

class RagularExpression {
  static RegExp passwordPattern = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$',
  );

  static RegExp phoneRegex = RegExp(r'^\+?[0-9]{10,}$');
}

class VilidationApp {
  //? validatio any text form filed
  String? validator(String value) {
    if (value.isEmpty) {
      return ValidationWords.requiredField;
    } else if (value.trim().isEmpty) {
      return ValidationWords.noSpaces;
    } else {
      return null;
    }
  }

//? validation any drop dowan form filed
  String? validateDropdownFormField(dynamic value) {
    if (value == null) {
      return ValidationWords.requiredField;
    }
    return null;
  }

//? validation to password
  String? validatorPassword({required String value}) {
    if (value.isEmpty) {
      return ValidationWords.requiredField;
    } else if (value.trim().isEmpty) {
      return ValidationWords.noSpaces;
    } else if (value.length < 6) {
      return ValidationWords.passwordLength;
    }
    return null;
  }

//? vilidation for phone number
  String? validatorPhone(String value) {
    if (value.isEmpty) {
      return ValidationWords.requiredField;
    } else if (value.trim().isEmpty) {
      return ValidationWords.noSpaces;
    } else if (!RagularExpression.phoneRegex.hasMatch(value)) {
      return ValidationWords.phoneNumber;
    }
    return null;
  }

  //? vilidation for Renetr Password
  String? validatorRenEnterPassword(String value, String newPassword) {
    if (value.isEmpty) {
      return ValidationWords.requiredField;
    } else if (value.length < 6) {
      return ValidationWords.passwordLength;
    } else if (value.trim().isEmpty) {
      return ValidationWords.noSpaces;
    } else if (newPassword != value) {
      return ValidationWords.reenterPasswoprd;
    }
    return null;
  }
}
