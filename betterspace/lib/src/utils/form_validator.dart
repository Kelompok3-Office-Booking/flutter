class FormValidator {

  /// validate with confirm password
  static String? validate({
    String? value1,
    String? value2,
    required String title,
  }) {
    if (value1!.isEmpty) {
      return 'field can\'t be empty !';
    } else if (value1.length < 8) {
      return '$title must be longer than 8 characters';
    } else if (!RegExp(".*[0-9].*").hasMatch(value1)) {
      return '$title should contain a numeric value 1-9';
    } else if (!RegExp('.*[a-z].*').hasMatch(value1)) {
      return '$title should contain a lowercase letter a-z';
    } else if (!RegExp('.*[A-Z].*').hasMatch(value1)) {
      return '$title should contain an uppercase letter A-Z';
    } else if (value2 != value1) {
      return '$title must be the same';
    }
    return null;
  }

  /// single validate
  static String? validateProfilName({
    String? value1,
    required String title,
  }) {
    if (value1!.isEmpty) {
      return 'field can\'t be empty !';
    } else if (value1.length < 5) {
      return '$title must be longer than 5 characters';
    } else if (!RegExp('.*[a-z].*').hasMatch(value1)) {
      return '$title should contain a lowercase letter a-z';
    } else if (!RegExp('.*[A-Z].*').hasMatch(value1)) {
      return '$title should contain an uppercase letter A-Z';
    }
    return null;
  }
}
