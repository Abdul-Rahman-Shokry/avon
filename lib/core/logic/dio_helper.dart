import 'package:dio/dio.dart';

enum DataState { loading, failed, success }

class DioHelper {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://cosmatics.growfet.com',
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );

  static String? token;

  static Future<CustomResponse> postData(String endpoint, {Map<String, dynamic>? body,}) async {
    Map<String, dynamic> requestHeaders = {};
    if (token != null) {
      requestHeaders["Authorization"] = "Bearer $token";
    }

    try {
      final resp = await _dio.post(
        endpoint,
        data: body,
        options: Options(headers: requestHeaders),
      );

      if (endpoint == "/api/Auth/login") {
        token = resp.data["token"];
      } else if (endpoint == "/api/Auth/logout") {
        token = null;
        print("Logged out successfully, Token cleared.");
      }

      if (resp.statusCode != null &&
          resp.statusCode! >= 200 &&
          resp.statusCode! < 300) {
        return CustomResponse(isSuccess: true, successData: resp.data);
      } else {
        return CustomResponse(isSuccess: false);
      }

    } on DioException catch (e) {
      String? errorMessage;
      if (e.response?.data != null && e.response?.data is Map) {
        errorMessage = e.response?.data["message"];
      } else {
        errorMessage = e.message;
      }

      return CustomResponse(
        isSuccess: false,
        errorMsg: errorMessage,
        errorStatusCode: e.response?.statusCode,
      );
    } catch (e) {
      return CustomResponse(isSuccess: false, errorMsg: "Unexpected Error");
    }
  }

  static Future<CustomResponse> getData(String endpoint, {Map<String, dynamic>? queryParameters,}) async {
    Map<String, dynamic> requestHeaders = {};
    if (token != null) {
      requestHeaders["Authorization"] = "Bearer $token";
    }

    try {
      final resp = await _dio.get(
          endpoint,
          options: Options(headers: requestHeaders),
          queryParameters: queryParameters
      );

      Map<String, dynamic> data;

      if(resp.data is List){
        data = {"list": resp.data};
      } else {
        data = resp.data;
      }

      if (resp.statusCode != null &&
          resp.statusCode! >= 200 &&
          resp.statusCode! < 300) {
        return CustomResponse(isSuccess: true, successData: data);
      } else {
        return CustomResponse(isSuccess: false);
      }

    } on DioException catch (e) {
      String? errorMessage;
      if (e.response?.data != null && e.response?.data is Map) {
        errorMessage = e.response?.data["message"];
      } else {
        errorMessage = e.message;
      }

      return CustomResponse(
        isSuccess: false,
        errorMsg: errorMessage,
        errorStatusCode: e.response?.statusCode,
      );
    } catch (e) {
      return CustomResponse(isSuccess: false, errorMsg: "Unexpected Error");
    }
  }
}

class CustomResponse {
  final bool isSuccess;
  final String? errorMsg;
  final int? errorStatusCode;
  final dynamic successData;

  CustomResponse({
    required this.isSuccess,
    this.errorMsg,
    this.successData,
    this.errorStatusCode,
  });
}
