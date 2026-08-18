class InputValidator {

  static String? passwordValidator(String? value) {
    if(value!.isEmpty){
      return "Password is required";
    } else if(value.length < 7) {
      return "Password must be at least 7 characters";
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if(value!.isEmpty){
      return "Phone is required";
    } else if (value.length < 10){
      return "Phone must be 10 digits";
    }
    return null;
  }
}