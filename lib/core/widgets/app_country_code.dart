import 'package:avon/core/logic/dio_helper.dart';
import 'package:avon/core/utils/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_image.dart';

class AppCountryCode extends StatefulWidget {
  final ValueChanged<String>? onCountryCodeChanged;

  const AppCountryCode({super.key, required this.onCountryCodeChanged});

  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  late String selectedCountryCode;
  late List<CountryModel> list;

  @override
  void initState() {
    super.initState();
    getData();
  }

  DataState state = DataState.loading;

  Future<void> getData() async {
    state = DataState.loading;
    setState(() {});

    final resp = await DioHelper.getData('/api/Countries');

    if (resp.isSuccess) {
      list = CountriesData.fromJson(resp.successData ?? {}).list;
      selectedCountryCode = list
          .firstWhere((e) => e.code == "+966", orElse: () => list.first)
          .code;
      widget.onCountryCodeChanged?.call(selectedCountryCode);
      state = DataState.success;
    } else {
      showMsg(resp.errorMsg, isError: true);
      state = DataState.failed;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(
            context,
          ).inputDecorationTheme.enabledBorder!.borderSide.color,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: state == DataState.failed
            ? IconButton(onPressed: getData, icon: Icon(Icons.replay))
            : state == DataState.loading
            ? CircularProgressIndicator()
            : DropdownButton<String>(
                icon: Padding(
                  padding: EdgeInsetsDirectional.only(start: 6.w),
                  child: AppImage(
                    "down.svg",
                    width: 10.w,
                    height: 7.h,
                    fit: BoxFit.fill,
                  ),
                ),
                value: selectedCountryCode,
                items: list
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.code,
                        child: Text(
                          e.code,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  selectedCountryCode = value!;
                  widget.onCountryCodeChanged?.call(selectedCountryCode);
                  setState(() {});
                },
              ),
      ),
    );
  }
}

class CountriesData {
  late final List<CountryModel> list;

  CountriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => CountryModel.fromJson(e)).toList();
  }
}

class CountryModel {
  late final int id;
  late final String code;
  late final String nameEn;
  late final String nameAr;

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    code = json['code'] ?? "";
    nameEn = json['name_en'] ?? "";
    nameAr = json['name_ar'] ?? "";
  }
}
