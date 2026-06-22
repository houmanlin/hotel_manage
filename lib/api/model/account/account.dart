


import '../../http_request.dart';
import '../comm/response_comm.dart';

class SendSmsCodeParams {
  final String mobile;
  final int scene;
  final String? code;
  final String? socialState;
  final String? socialCode;
  final String? socialType;
  SendSmsCodeParams({required this.mobile, required this.scene, this.code, this.socialState, this.socialCode, this.socialType});


  factory SendSmsCodeParams.fromJson(dynamic json) {
    return SendSmsCodeParams(
      mobile: json['mobile'] as String,
      scene: json['scene'] as int,
      code: json['code'] as String,
      socialState: json['socialState'] as String,
      socialCode: json['socialCode'] as String,
      socialType: json['socialType'] as String,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
      'scene': scene,
      'code': code,
      'socialState':socialState,
      'socialCode':socialCode,
      'socialType':socialType,
    };
  }
}

class AccountApi {
  static Future<ResponseComm> sendSmsCode(SendSmsCodeParams queryParam) async {
    final response = await HttpRequest.instance.post(
      'member/auth/send-sms-code',
      queryParameters: queryParam.toJson(),
    );
    return response;
  }


  static Future<ResponseComm> validSmsCode(SendSmsCodeParams queryParam) async {
    final response = await HttpRequest.instance.post(
      'member/auth/validate-sms-code',
      queryParameters: queryParam.toJson(),
    );
    return response;
  }


  static Future<ResponseComm> loginAccount(SendSmsCodeParams queryParam) async {
    final response = await HttpRequest.instance.post(
      'member/auth/sms-login',
      queryParameters: queryParam.toJson(),
    );
    return response;
  }
}