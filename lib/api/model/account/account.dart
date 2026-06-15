


import '../../http_request.dart';
import '../comm/response_comm.dart';

class SendSmsCodeParams {
  final String mobile;
  final int scene;

  SendSmsCodeParams({required this.mobile, required this.scene});


  factory SendSmsCodeParams.fromJson(dynamic json) {
    return SendSmsCodeParams(
      mobile: json['mobile'] as String,
      scene: json['scene'] as int,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
      'scene': scene,
    };
  }
}

class AccountApi {
  static Future<ResponseComm> sendSmsCode(SendSmsCodeParams queryParam) async {
    final response = await HttpRequest.instance.get(
      'member/auth/send-sms-code',
      queryParameters: queryParam.toJson(),
    );
    return response;
  }

}