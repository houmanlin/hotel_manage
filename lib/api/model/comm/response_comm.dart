class ResponseComm<T> {
  final int Code;
  final String Msg;
  final T? Data;
  ResponseComm({required this.Code, required this.Msg, required this.Data});

  /// 从 JSON 解析，需要传入一个将 JSON 转为 T 的解析函数
  factory ResponseComm.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic) fromJsonT,
      ) {
    return ResponseComm<T>(
      Code: json['Code'] as int,
      Msg: json['Msg'] as String,
      Data: json['Data'] != null ? fromJsonT(json['Data']) : null,
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
