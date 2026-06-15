String? getFirstImageUrl(String? imageUrls) {
  if (imageUrls == null || imageUrls.isEmpty) return null;
  return imageUrls.split(',').first.trim(); // trim 去除可能存在的空格
}