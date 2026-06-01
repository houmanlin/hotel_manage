import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class HotelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;
  final String? tagText;
  final Color? tagColor;
  final String? subPrice;
  final String? extraInfo;
  final VoidCallback? onTap;
  final double imageWidth;
  final double imageHeight;
  final EdgeInsets padding;

  const HotelCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
    this.tagText,
    this.tagColor,
    this.subPrice,
    this.extraInfo,
    this.onTap,
    this.imageWidth = 120,
    this.imageHeight = 90,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(containerBigRadian)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(containerBigRadian)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.all(Radius.circular(containerBigRadian)),
          child: Container(
            padding: padding,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(),
                SizedBox(width: 12),
                Expanded(child: _buildContent()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: imageWidth,
                height: imageHeight,
                color: Colors.grey[200],
                child: Icon(Icons.broken_image, color: Colors.grey),
              );
            },
          ),
        ),
        if (tagText != null)
          Positioned(
            top: 4,
            right: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: tagColor ?? Colors.orange,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                tagText!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildContent() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 12, color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Text(
                '¥',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Text(
                price.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Text('/晚', style: TextStyle(fontSize: 12, color: Colors.grey)),
              Spacer(),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 14),
                  SizedBox(width: 2),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '(${reviewCount}条)',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          if (subPrice != null)
            Text(subPrice!, style: TextStyle(fontSize: 12, color: Colors.grey)),
          if (extraInfo != null)
            Text(
              extraInfo!,
              style: TextStyle(fontSize: 12, color: tagColor ?? Colors.orange),
            ),
        ],
      ),
    );
  }
}
