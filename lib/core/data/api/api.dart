import 'package:dio/dio.dart';
import 'package:untitled/core/dialoges/toast.dart';
import 'package:untitled/features/layout/todo_app_cubit.dart';

class Api {
  String baseUrl = 'https://todo.iraqsapp.com/';
  Future getHttp(context, {authToken, url}) async {
    try {
      var response = await Dio().get(baseUrl + url,
          options: Options(
            headers: {
              "Authorization": 'Bearer $authToken',
            },
          ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        var productsList = response.data;
        return productsList;
      } else {
        return '';
      }
    } on DioError catch (e) {
      print(e.response!.data['message'].toString());
      print(e.response!.statusCode);
      if (e.response!.data['message'].toString() == 'Unauthorized' ||
          e.response!.statusCode == 401) {
        TodoAppCubit.get(context).reFreshToken(context);
      } else {
        throw Exception(e.response!.data);
      }
    }
  }

  Future getHttpWithoutToken(context, {url}) async {
    try {
      var response = await Dio().get(baseUrl + url, options: Options());
      if (response.statusCode == 200 || response.statusCode == 201) {
        var productsList = response.data;
        return productsList;
      } else {
        return '';
      }
    } on DioError catch (e) {
      if (e.response!.data['message'].toString() == 'Unauthorized' ||
          e.response!.statusCode == 401) {
        TodoAppCubit.get(context).reFreshToken(context);
      } else {
        throw Exception(e.response!.data);
      }
    }
  }

  Future<dynamic> postHttp(context,
      {required url, data, authToken, queryParams}) async {
    try {
      var response = await Dio().post('$baseUrl$url',
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: {
              "Authorization": 'Bearer $authToken',
            },
          ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response!.data['message'].toString() == 'Unauthorized' ||
          e.response!.statusCode == 401) {
        TodoAppCubit.get(context).reFreshToken(context);
      } else {
        throw Exception(e.response!.data);
      }
    }
  }

  Future<dynamic> postHttpImage(context,
      {required url, data, authToken, queryParams}) async {
    try {
      var response = await Dio().post('$baseUrl$url',
          data: data,
          // queryParameters: queryParams,
          options: Options(
            headers: {
               "Content-type": "multipart/form-data",
              "Authorization": 'Bearer $authToken',
            },
          ));

      print(response.statusCode);
      // print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("response");
        return response.data;
      }
    } on DioError catch (e) {
      print(e.response!.data['message'].toString());
      if (e.response!.data['message'].toString() == 'Unauthorized' ||
          e.response!.statusCode == 401) {
        showToast(msg: 'please wait second and try again', state: ToastedStates.WARNING);
        TodoAppCubit.get(context).reFreshToken(context);
      } else {
        throw Exception(e.response!.data);
      }
    }
  }

  Future<dynamic> postHttpRegister(context,
      {required url, data, authToken, queryParams}) async {
    try {
      var response = await Dio().post('$baseUrl$url',
          data: data, queryParameters: queryParams, options: Options());
      print(response);
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response!.data['message'].toString() == 'Unauthorized' ||
          e.response!.statusCode == 401) {
        TodoAppCubit.get(context).reFreshToken(context);
      } else {
        throw Exception(e.response!.data);
      }
    }
  }

  Future<dynamic> putHttp(context,
      {required url, required data, authToken}) async {
    try {
      var response = await Dio().put('$baseUrl$url',
          data: data,
          options: Options(headers: {
            "Authorization": 'Bearer $authToken',
          }));
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response!.data['message'].toString() == 'Unauthorized' ||
          e.response!.statusCode == 401) {
        TodoAppCubit.get(context).reFreshToken(context);
      } else {
        throw Exception(e.response!.data);
      }
    }
  }

  Future<dynamic> deleteHttp(context, {required url, data, authToken}) async {
    try {
      var response = await Dio().delete(baseUrl + url,
          data: data,
          options: Options(
            headers: {
              "Authorization": 'Bearer $authToken',
            },
          ));
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response!.data['message'].toString() == 'Unauthorized' ||
          e.response!.statusCode == 401) {
        TodoAppCubit.get(context).reFreshToken(context);
      } else {
        throw Exception(e.response!.data);
      }
    }
  }
}
