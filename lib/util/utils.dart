import 'dart:math';

String? getFirstImageUrl(String? imageUrls) {
  if (imageUrls == null || imageUrls.isEmpty) return null;
  return imageUrls.split(',').first.trim(); // trim 去除可能存在的空格
}

String getPseudoUuid() {
  final random = Random();
  return '${random.nextHex(8)}-${random.nextHex(4)}-4${random.nextHex(3)}-${random.nextHex(4)}-${random.nextHex(12)}';
}

extension on Random {
  String nextHex(int length) => List.generate(length, (_) => nextInt(16).toRadixString(16)).join();
}