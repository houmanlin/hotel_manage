import 'package:hotel_manage/api/http_request.dart';
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
  final String id;
  final String? deptId;
  final String name;
  final String code;
  final String? phone;
  final String address;
  final String? startBusinessTime;
  final String? endBusinessTime;
  final int? status;
  final String? basePrice;
  final String? remark;
  String imageUrls;      // 注意：这里是单张图片的字符串，虽然键名带 s
  final String? createTime;

  Store({
    required this.id,
    this.deptId,
    required this.name,
    required this.code,
    this.basePrice,
    this.phone,
    required this.address,
    this.startBusinessTime,
    this.endBusinessTime,
    this.status,
    this.remark,
    required this.imageUrls,
    this.createTime,
  });

  factory Store.fromJson(dynamic json) {
    return Store(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String,
      startBusinessTime: json['startBusinessTime'] as String?,
      endBusinessTime: json['endBusinessTime'] as String?,
      status: json['status'] as int?,
      // basePrice: json['basePrice'] as String,
      remark: json['remark'] as String?,
      imageUrls: json['imageUrls'] as String,
      createTime: json['createTime'] as String?,
    );
  }

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

  static Future<ResponseComm> getStoreInfo(String Id) async {
    final response = await HttpRequest.instance.get(
      'hotel/store/get',
      queryParameters: {"id": Id},
    );
    return response;
  }
}