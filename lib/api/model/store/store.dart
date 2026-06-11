import 'package:hotel_manage/api/http_request.dart';
import 'package:hotel_manage/api/model/comm/page_response_comm.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';

class StoreParams {
  final String? name;
  final String? code;
  final String? phone;
  final String? address;
  final String? startBusinessTime;
  final String? endBusinessTime;
  final int? status;
  final String? remark;
  final String? imageUrls;
  final String? createTime;
  final int pageNo;
  final int pageSize;

  const StoreParams({
    this.name,
    this.code,
    this.phone,
    this.address,
    this.startBusinessTime,
    this.endBusinessTime,
    this.status,
    this.remark,
    this.imageUrls,
    this.createTime,
    required this.pageNo,
    required this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (startBusinessTime != null) 'startBusinessTime': startBusinessTime,
      if (endBusinessTime != null) 'endBusinessTime': endBusinessTime,
      if (status != null) 'status': status,
      if (remark != null) 'remark': remark,
      if (imageUrls != null) 'imageUrls': imageUrls,
      if (createTime != null) 'createTime': createTime,
      'pageNo': pageNo,
      'pageSize': pageSize,
    };
  }
}
class Store {
  /// 主键
  final int id;

  /// 部门ID，对应 system_dept.id
  final int deptId;

  /// 门店名称
  final String name;

  /// 门店编码
  final String code;

  /// 电话
  final String phone;

  /// 地址
  final String address;

  /// 开始营业时间 HH:mm
  final String startBusinessTime;

  /// 结束营业时间 HH:mm
  final String endBusinessTime;

  /// 状态 0停用 1启用
  final int status;

  /// 备注
  final String? remark; // 可选字段

  /// 图片地址
  final String imageUrls;

  /// 创建时间
  final Map<String, dynamic> createTime;

  /// 最低房价 元
  final int basePrice;

  Store({
    required this.id,
    required this.deptId,
    required this.name,
    required this.code,
    required this.phone,
    required this.address,
    required this.startBusinessTime,
    required this.endBusinessTime,
    required this.status,
    this.remark,
    required this.imageUrls,
    required this.createTime,
    required this.basePrice,
  });

  /// 从 JSON 创建 Store 对象
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'] as int,
      deptId: json['deptId'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      startBusinessTime: json['startBusinessTime'] as String,
      endBusinessTime: json['endBusinessTime'] as String,
      status: json['status'] as int,
      remark: json['remark'] as String?,
      imageUrls: json['imageUrls'] as String,
      createTime: json['createTime'] as Map<String, dynamic>,
      basePrice: json['basePrice'] as int,
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deptId': deptId,
      'name': name,
      'code': code,
      'phone': phone,
      'address': address,
      'startBusinessTime': startBusinessTime,
      'endBusinessTime': endBusinessTime,
      'status': status,
      'remark': remark,
      'imageUrls': imageUrls,
      'createTime': createTime,
      'basePrice': basePrice,
    };
  }
}

class StoreApi {
  static Future<ResponseComm> getStoreList(StoreParams queryParam) async {
    final response = await HttpRequest.instance.get(
      'hotel/store/page',
      queryParameters: queryParam.toJson(),
    );
    return response;
  }
}