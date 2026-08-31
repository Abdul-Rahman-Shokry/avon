import 'package:flutter/material.dart';

import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/utils/helper_methods.dart';
import '../../home/view.dart';
import 'model.dart';

class LoginController {
  String? selectedCountryCode;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoginClicked = false;

  final formKey = GlobalKey<FormState>();

  DataState? state;

  Future<void> login() async {
    state = DataState.loading;
    // TODO: don't forget to handle this
    // setState(() {});

    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();

    final resp = await DioHelper.postData(
      "/api/Auth/login",
      body: {
        "countryCode": selectedCountryCode,
        "phoneNumber": phone,
        "password": password,
      },
    );

    if (resp.isSuccess) {
      state = DataState.success;
      showMsg("Welcome: ${resp.successData["user"]["username"]}");
      final data = UserData.fromJson(resp.successData);
      await CacheHelper.saveUserData(data: data);
      goTo(page: HomeView(), canPop: false);
    } else {
      state = DataState.loading;
      showMsg(resp.errorMsg, isError: true);
    }

    // TODO: don't forget to handle this
    // setState(() {});
  }

  void onChangeFormData() {
    if (isLoginClicked) {
      formKey.currentState!.validate();
    }
  }

  void onCountryCodeChanged(dynamic value) {
    selectedCountryCode = value;
  }

  void onPressLoginButton() {
    isLoginClicked = true;
    if (formKey.currentState!.validate()) {
      login();
    }
  }

  bool get loginButtonIsLoading => state == DataState.loading;
}
