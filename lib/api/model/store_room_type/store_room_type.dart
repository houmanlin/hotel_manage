import 'package:hotel_manage/api/http_request.dart';
import 'package:hotel_manage/api/model/comm/response_comm.dart';

class StoreRoomType {
  final String id;
  final String? storeId;
  final String name;
  final String code;
  final String area;
  final String bedType;
  final int? maxGuestCount;
  final String? basePrice;      // 元，支持小数
  final String? depositAmount;  // 元，支持小数
  String imageUrls;
  final int? status;
  final int? sort;
  final String remark;
  final String? createTime;     // 虽定义为 Record，实践中多为字符串
  final List<Facility>? facilityDOS;

  StoreRoomType({
    required this.id,
    this.storeId,
    required this.name,
    required this.code,
    required this.area,
    required this.bedType,
    this.maxGuestCount,
    this.basePrice,
    this.depositAmount,
    required this.imageUrls,
    this.status,
    this.sort,
    required this.remark,
    this.createTime,
    this.facilityDOS,
  });

  factory StoreRoomType.fromJson(dynamic json) {
    return StoreRoomType(
      id: json['id'] as String,
      storeId: json['storeId'] as String?,
      name: json['name'] as String,
      code: json['code'] as String,
      area: json['area'] as String,
      bedType: json['bedType'] == null ? "" : json['bedType'] as String,
      maxGuestCount: json['maxGuestCount'] as int?,
      basePrice: (json['basePrice']),
      depositAmount: (json['depositAmount']),
      imageUrls: json['imageUrls'] as String,
      status: json['status'] as int?,
      sort: json['sort'] as int?,
      remark: json['remark'] == null ? "" : json['remark'] as String,
      createTime: json['createTime'] as String?,
      facilityDOS: json['facilityDOS'] != null
          ? (json['facilityDOS'] as List<dynamic>)
          .map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'storeId': storeId,
      'name': name,
      'code': code,
      'area': area,
      'bedType': bedType,
      'maxGuestCount': maxGuestCount,
      'basePrice': basePrice,
      'depositAmount': depositAmount,
      'imageUrls': imageUrls,
      'status': status,
      'sort': sort,
      'remark': remark,
      'createTime': createTime,
      'facilityDOS': facilityDOS?.map((e) => e.toJson()).toList(),
    };
  }
}

class Facility {
  final int? createTime;
  final int? updateTime;
  final String? creator;
  final String? updater;
  final bool? deleted;
  final String? id;
  final String? name;
  final int? status;

  Facility({
    this.createTime,
    this.updateTime,
    this.creator,
    this.updater,
    this.deleted,
    this.id,
    this.name,
    this.status,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      createTime: json['createTime'] as int?,
      updateTime: json['updateTime'] as int?,
      creator: json['creator'] as String?,
      updater: json['updater'] as String?,
      deleted: json['deleted'] as bool?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createTime': createTime,
      'updateTime': updateTime,
      'creator': creator,
      'updater': updater,
      'deleted': deleted,
      'id': id,
      'name': name,
      'status': status,
    };
  }
}


class StoreRoomTypeParams {
  final String id;
  final String? storeId;
  final String name;
  final String code;
  final String? area;
  final String? bedType;
  final int? maxGuestCount;
  final int? basePrice;      // 单位：分
  final int? depositAmount;  // 单位：分
  final String? imageUrls;
  final int? status;
  final int? sort;
  final String? remark;
  final String? createTime;
  final dynamic facilityRespVOS; // 结构未明确，暂用 dynamic
  final int pageNo;
  final int pageSize;


  StoreRoomTypeParams({
    required this.id,
    this.storeId,
    required this.name,
    required this.code,
    this.area,
    this.bedType,
    this.maxGuestCount,
    this.basePrice,
    this.depositAmount,
    this.imageUrls,
    this.status,
    this.sort,
    this.remark,
    this.createTime,
    this.facilityRespVOS,
    required this.pageNo,
    required this.pageSize,
  });

  factory StoreRoomTypeParams.fromJson(Map<String, dynamic> json) {
    return StoreRoomTypeParams(
      id: json['id'] as String,
      storeId: json['storeId'] as String?,
      name: json['name'] as String,
      code: json['code'] as String,
      area: json['area'] as String?,
      bedType: json['bedType'] as String?,
      maxGuestCount: json['maxGuestCount'] as int?,
      basePrice: json['basePrice'] as int?,
      depositAmount: json['depositAmount'] as int?,
      imageUrls: json['imageUrls'] as String?,
      status: json['status'] as int?,
      sort: json['sort'] as int?,
      remark: json['remark'] as String?,
      createTime: json['createTime'] as String?,
      facilityRespVOS: json['facilityRespVOS'],
      pageNo: json['pageNo'] as int,
      pageSize: json['pageSize'] as int,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (storeId != null) 'storeId': storeId,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (area != null) 'area': area,
      if (bedType != null) 'bedType': bedType,
      if (maxGuestCount != null) 'maxGuestCount': maxGuestCount,
      if (basePrice != null) 'basePrice': basePrice,
      if (depositAmount != null) 'depositAmount': depositAmount,
      if (imageUrls != null) 'imageUrls': imageUrls,
      if (status != null) 'status': status,
      if (sort != null) 'sort': sort,
      'pageNo': pageNo,
      'pageSize': pageSize,
    };
  }
}

class StoreRoomTypeApi {
  static Future<ResponseComm> getStoreRoomTypeList(StoreRoomTypeParams queryParam) async {
    final response = await HttpRequest.instance.get(
      'hotel/room-type/page',
      queryParameters: queryParam.toJson(),
    );
    return response;
  }
  static Future<ResponseComm> getStoreRoomTypeInfo(String Id) async {
    final response = await HttpRequest.instance.get(
      'hotel/room-type/get',
      queryParameters: {"id": Id},
    );
    return response;
  }
}