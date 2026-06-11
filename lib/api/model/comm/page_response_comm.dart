class PageResponseComm<T> {
  final int Total;
  final T? Data;

  PageResponseComm({required this.Total, required this.Data});

  /// 从 JSON 解析，需要传入一个将 JSON 转为 T 的解析函数
  factory PageResponseComm.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic) fromJsonT,
      ) {
    return PageResponseComm(
      Total: json['Code'] as int,
      Data: json['Data'] != null ? fromJsonT(json['Data']) : null,
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