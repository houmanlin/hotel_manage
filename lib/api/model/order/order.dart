import '../../http_request.dart';
import '../comm/response_comm.dart';
import '../store/store.dart';

class OrderRequest {
  final String? storeId;
  final String? orderNo;
  final String? source;
  final String? orderType;
  final String? customerId;
  final String? contactName;
  final String? contactMobile;
  final String? status;
  final String? checkInDate;
  final String? checkOutDate;
  final String? nightCount;
  final String? roomCount;
  final String? totalAmount;
  final String? paidAmount;
  final String? depositAmount;
  final String? remark;
  final String? cancelReason;
  final String? canceledTime;
  final String? version;
  final String? createTime;
  final List<String> sortingFields;
  final int pageNo;
  final int pageSize;
  OrderRequest({
    this.storeId = "",
    this.orderNo = "",
    this.source = "",
    this.orderType = "",
    this.customerId = "",
    this.contactName = "",
    this.contactMobile = "",
    this.status = "",
    this.checkInDate = "",
    this.checkOutDate = "",
    this.nightCount = "",
    this.roomCount = "",
    this.totalAmount = "",
    this.paidAmount = "",
    this.depositAmount = "",
    this.remark = "",
    this.cancelReason = "",
    this.canceledTime = "",
    this.version = "",
    this.createTime = "",
    required this.sortingFields,
    this.pageNo = 1,
    this.pageSize = 20,
});

  factory OrderRequest.fromJson(Map<String, dynamic> json) {
    return OrderRequest(
        storeId: json["storeId"] as String?,
        orderNo: json["orderNo"] as String?,
        source: json["source"] as String?,
        orderType: json["orderType"] as String?,
        customerId: json["customerId"] as String?,
        contactName: json["contactName"] as String?,
        contactMobile: json["contactMobile"] as String?,
        status: json["status"] as String?,
        checkInDate: json["checkInDate"] as String?,
        checkOutDate: json["checkOutDate"] as String?,
        nightCount: json["nightCount"] as String?,
        roomCount: json["roomCount"] as String?,
        totalAmount: json["totalAmount"] as String?,
        paidAmount: json["paidAmount"] as String?,
        depositAmount: json["depositAmount"] as String?,
        remark: json["remark"] as String?,
        cancelReason: json["cancelReason"] as String?,
        canceledTime: json["canceledTime"] as String?,
        version: json["version"] as String?,
        createTime: json["createTime"] as String?,
        sortingFields: json["sortingFields"] as List<String>,
        pageNo: json["pageNo"] as int,
        pageSize: json["pageSize"] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "storeId": storeId,
      "orderNo": orderNo,
      "source": source,
      "orderType": orderType,
      "customerId": customerId,
      "contactName": contactName,
      "contactMobile": contactMobile,
      "status": status,
      "checkInDate": checkInDate,
      "checkOutDate": checkOutDate,
      "nightCount": nightCount,
      "roomCount": roomCount,
      "totalAmount": totalAmount,
      "paidAmount": paidAmount,
      "depositAmount": depositAmount,
      "remark": remark,
      "cancelReason": cancelReason,
      "canceledTime": canceledTime,
      "version": version,
      "createTime": createTime,
      "sortingFields": sortingFields,
      "pageNo": pageNo,
      "pageSize": pageSize,
    };
  }
}


class OrderData {
  final String? id;
  final String? storeId;
  final String? orderNo;
  final int? source;
  final int? orderType;
  final String? customerId;
  final String? contactName;
  final String? contactMobile;
  final int? status;
  final String checkInDate;   // 或 String?，根据实际调整
  final String checkOutDate;
  final int nightCount;
  final int? roomCount;
  final int? totalAmount;
  final int? paidAmount;
  final int? depositAmount;
  final String? remark;
  final String? cancelReason;
  final String? canceledTime;
  final int? version;
  final int? createTime;
  final CancelRequest? cancelRequest;
  final BillDO? billDO;
  final List<BillItemDO>? billItemDOList;
  final OrderRoomDO? orderRoomDO;
  final Store? store;

  OrderData({
    this.id,
    this.storeId,
    this.orderNo,
    this.source,
    this.orderType,
    this.customerId,
    this.contactName,
    this.contactMobile,
    this.status,
    required this.checkInDate,
    required this.checkOutDate,
    required this.nightCount,
    this.roomCount,
    this.totalAmount,
    this.paidAmount,
    this.depositAmount,
    this.remark,
    this.cancelReason,
    this.canceledTime,
    this.version,
    this.createTime,
    this.cancelRequest,
    this.billDO,
    this.billItemDOList,
    this.orderRoomDO,
    this.store,
  });

  factory OrderData.fromJson(dynamic json) {
    return OrderData(
      id: json['id'] as String?,
      storeId: json['storeId'] as String?,
      orderNo: json['orderNo'] as String?,
      source: json['source'] as int?,
      orderType: json['orderType'] as int?,
      customerId: json['customerId'] as String?,
      contactName: json['contactName'] as String?,
      contactMobile: json['contactMobile'] as String?,
      status: json['status'] as int?,
      checkInDate: json['checkInDate'] == null ? "" : json['checkInDate'] as String,
      checkOutDate: json['checkOutDate'] == null ? "" : json['checkOutDate'] as String,
      nightCount: json['nightCount'] == null ? 1 : json['nightCount'] as int,
      roomCount: json['roomCount'] as int?,
      totalAmount: json['totalAmount'] as int?,
      paidAmount: json['paidAmount'] as int?,
      depositAmount: json['depositAmount'] as int?,
      remark: json['remark'] as String?,
      cancelReason: json['cancelReason'] as String?,
      canceledTime: json['canceledTime'] as String?,
      version: json['version'] as int?,
      createTime: json['createTime'] as int?,
      cancelRequest: json['cancelRequest'] != null
          ? CancelRequest.fromJson(json['cancelRequest'] as Map<String, dynamic>)
          : null,
      billDO: json['billDO'] != null
          ? BillDO.fromJson(json['billDO'] as Map<String, dynamic>)
          : null,
      billItemDOList: (json['billItemDOList'] as List?)
          ?.map((e) => BillItemDO.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderRoomDO: json['orderRoomDO'] != null
          ? OrderRoomDO.fromJson(json['orderRoomDO'] as Map<String, dynamic>)
          : null,
      store: json['store'] != null
          ? Store.fromJson(json['store'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'storeId': storeId,
      'orderNo': orderNo,
      'source': source,
      'orderType': orderType,
      'customerId': customerId,
      'contactName': contactName,
      'contactMobile': contactMobile,
      'status': status,
      'checkInDate': checkInDate,
      'checkOutDate': checkOutDate,
      'nightCount': nightCount,
      'roomCount': roomCount,
      'totalAmount': totalAmount,
      'paidAmount': paidAmount,
      'depositAmount': depositAmount,
      'remark': remark,
      'cancelReason': cancelReason,
      'canceledTime': canceledTime,
      'version': version,
      'createTime': createTime,
      'cancelRequest': cancelRequest?.toJson(),
      'billDO': billDO?.toJson(),
      'billItemDOList': billItemDOList?.map((e) => e.toJson()).toList(),
      'orderRoomDO': orderRoomDO?.toJson(),
      'store': store?.toJson(),
    };
  }
}

// ============ 取消申请 ============
class CancelRequest {
  final int? id;
  final int? orderId;
  final int? storeId;
  final int? customerId;
  final String? reason;
  final int? status; // 0-pending, 1-approved, 2-rejected
  final int? auditUserId;
  final Map<String, dynamic>? auditTime;
  final String? rejectReason;
  final Map<String, dynamic>? createTime;

  CancelRequest({
    this.id,
    this.orderId,
    this.storeId,
    this.customerId,
    this.reason,
    this.status,
    this.auditUserId,
    this.auditTime,
    this.rejectReason,
    this.createTime,
  });

  factory CancelRequest.fromJson(Map<String, dynamic> json) {
    return CancelRequest(
      id: json['id'] as int?,
      orderId: json['orderId'] as int?,
      storeId: json['storeId'] as int?,
      customerId: json['customerId'] as int?,
      reason: json['reason'] as String?,
      status: json['status'] as int?,
      auditUserId: json['auditUserId'] as int?,
      auditTime: json['auditTime'] as Map<String, dynamic>?,
      rejectReason: json['rejectReason'] as String?,
      createTime: json['createTime'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderId': orderId,
      'storeId': storeId,
      'customerId': customerId,
      'reason': reason,
      'status': status,
      'auditUserId': auditUserId,
      'auditTime': auditTime,
      'rejectReason': rejectReason,
      'createTime': createTime,
    };
  }
}

// ============ 账单 ============
class BillDO {
  final int? createTime;
  final int? updateTime;
  final String? creator;
  final String? updater;
  final bool? deleted;
  final String? id;
  final String? storeId;
  final String? billNo;
  final String? orderId;
  final int? status;
  final num? receivableAmount;
  final num? paidAmount;
  final num? refundAmount;
  final num? discountAmount;
  final Map<String, dynamic>? settleTime;
  final String? remark;

  BillDO({
    this.createTime,
    this.updateTime,
    this.creator,
    this.updater,
    this.deleted,
    this.id,
    this.storeId,
    this.billNo,
    this.orderId,
    this.status,
    this.receivableAmount,
    this.paidAmount,
    this.refundAmount,
    this.discountAmount,
    this.settleTime,
    this.remark,
  });

  factory BillDO.fromJson(Map<String, dynamic> json) {
    return BillDO(
      createTime: json['createTime'] as int?,
      updateTime: json['updateTime'] as int?,
      creator: json['creator'] as String?,
      updater: json['updater'] as String?,
      deleted: json['deleted'] as bool?,
      id: json['id'] as String?,
      storeId: json['storeId'] as String?,
      billNo: json['billNo'] as String?,
      orderId: json['orderId'] as String?,
      status: json['status'] as int?,
      receivableAmount: json['receivableAmount'] as num?,
      paidAmount: json['paidAmount'] as num?,
      refundAmount: json['refundAmount'] as num?,
      discountAmount: json['discountAmount'] as num?,
      settleTime: json['settleTime'] as Map<String, dynamic>?,
      remark: json['remark'] as String?,
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
      'storeId': storeId,
      'billNo': billNo,
      'orderId': orderId,
      'status': status,
      'receivableAmount': receivableAmount,
      'paidAmount': paidAmount,
      'refundAmount': refundAmount,
      'discountAmount': discountAmount,
      'settleTime': settleTime,
      'remark': remark,
    };
  }
}

// ============ 账单明细 ============
class BillItemDO {
  final int? createTime;
  final int? updateTime;
  final String? creator;
  final String? updater;
  final bool? deleted;
  final String? id;
  final String? storeId;
  final String? billId;
  final String? orderId;
  final int? itemType;
  final String? itemName;
  final num? amount;
  final num? quantity;
  final List<dynamic>? bizDate;
  final String? remark;

  BillItemDO({
    this.createTime,
    this.updateTime,
    this.creator,
    this.updater,
    this.deleted,
    this.id,
    this.storeId,
    this.billId,
    this.orderId,
    this.itemType,
    this.itemName,
    this.amount,
    this.quantity,
    this.bizDate,
    this.remark,
  });

  factory BillItemDO.fromJson(Map<String, dynamic> json) {
    return BillItemDO(
      createTime: json['createTime'] as int?,
      updateTime: json['updateTime'] as int?,
      creator: json['creator'] as String?,
      updater: json['updater'] as String?,
      deleted: json['deleted'] as bool?,
      id: json['id'] as String?,
      storeId: json['storeId'] as String?,
      billId: json['billId'] as String?,
      orderId: json['orderId'] as String?,
      itemType: json['itemType'] as int?,
      itemName: json['itemName'] as String?,
      amount: json['amount'] as num?,
      quantity: json['quantity'] as num?,
      bizDate: json['bizDate'] as List<dynamic>?,
      remark: json['remark'] as String?,
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
      'storeId': storeId,
      'billId': billId,
      'orderId': orderId,
      'itemType': itemType,
      'itemName': itemName,
      'amount': amount,
      'quantity': quantity,
      'bizDate': bizDate,
      'remark': remark,
    };
  }
}

// ============ 订单房间 ============
class OrderRoomDO {
  final Map<String, dynamic>? createTime;
  final Map<String, dynamic>? updateTime;
  final String? creator;
  final String? updater;
  final bool? deleted;
  final int? id;
  final int? storeId;
  final int? orderId;
  final int? roomTypeId;
  final int? roomId;
  final String? roomNo;
  final num? priceAmount;
  final Map<String, dynamic>? checkInDate;
  final Map<String, dynamic>? checkOutDate;
  final int? status;
  final Map<String, dynamic>? actualCheckInTime;
  final Map<String, dynamic>? actualCheckOutTime;

  OrderRoomDO({
    this.createTime,
    this.updateTime,
    this.creator,
    this.updater,
    this.deleted,
    this.id,
    this.storeId,
    this.orderId,
    this.roomTypeId,
    this.roomId,
    this.roomNo,
    this.priceAmount,
    this.checkInDate,
    this.checkOutDate,
    this.status,
    this.actualCheckInTime,
    this.actualCheckOutTime,
  });

  factory OrderRoomDO.fromJson(Map<String, dynamic> json) {
    return OrderRoomDO(
      createTime: json['createTime'] as Map<String, dynamic>?,
      updateTime: json['updateTime'] as Map<String, dynamic>?,
      creator: json['creator'] as String?,
      updater: json['updater'] as String?,
      deleted: json['deleted'] as bool?,
      id: json['id'] as int?,
      storeId: json['storeId'] as int?,
      orderId: json['orderId'] as int?,
      roomTypeId: json['roomTypeId'] as int?,
      roomId: json['roomId'] as int?,
      roomNo: json['roomNo'] as String?,
      priceAmount: json['priceAmount'] as num?,
      checkInDate: json['checkInDate'] as Map<String, dynamic>?,
      checkOutDate: json['checkOutDate'] as Map<String, dynamic>?,
      status: json['status'] as int?,
      actualCheckInTime: json['actualCheckInTime'] as Map<String, dynamic>?,
      actualCheckOutTime: json['actualCheckOutTime'] as Map<String, dynamic>?,
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
      'storeId': storeId,
      'orderId': orderId,
      'roomTypeId': roomTypeId,
      'roomId': roomId,
      'roomNo': roomNo,
      'priceAmount': priceAmount,
      'checkInDate': checkInDate,
      'checkOutDate': checkOutDate,
      'status': status,
      'actualCheckInTime': actualCheckInTime,
      'actualCheckOutTime': actualCheckOutTime,
    };
  }
}

class OrderApi {
  static Future<ResponseComm> getOrderList(OrderRequest queryParam) async {
    final response = await HttpRequest.instance.get(
      '/hotel/order/page',
      queryParameters: queryParam.toJson(),
    );
    return response;
  }

}