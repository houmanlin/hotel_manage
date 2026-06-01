class HotelModel {
  final String ImageUrl;
  final String Title;
  final String Description;
  final double Price;
  final double Rating;
  final int ReviewCount;
  final String TagText;
  final String TagColor;
  final String ExtraInfo;

  HotelModel({
    required this.ImageUrl,
    required this.Title,
    this.Description = "",
    this.Price = 0,
    this.Rating = 0,
    this.ReviewCount = 0,
    this.TagText = "",
    this.TagColor = "",
    this.ExtraInfo = "",
  });
}