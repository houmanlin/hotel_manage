class ResponseComm {
  final int Code;
  final String Msg;
  final dynamic Data;
  ResponseComm({required this.Code, required this.Msg, required this.Data});

  /// 从 JSON 解析，需要传入一个将 JSON 转为 T 的解析函数
  factory ResponseComm.fromJson(
      Map<String, dynamic> json,
      ) {
    return ResponseComm(
      Code: json['Code'] as int,
      Msg: json['Msg'] as String,
      Data: json['Data'],
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'Code': Code,
      'Msg': Msg,
      'Data': Data,
    };
  }
}


class PageResponseComm<T> {
  final int Total;
  final List<T> Data;

  PageResponseComm({required this.Total, required this.Data});

  /// 从 JSON 解析，需要传入一个将 JSON 转为 T 的解析函数
  factory PageResponseComm.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic) fromJsonT,
      ) {
    return PageResponseComm(
      Total: json['total'] as int,
      Data: (json['list'] as List<dynamic>)
          .map((e) => fromJsonT(e))
          .toList(),
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'total': Total,
      'data': Data,
    };
  }
}