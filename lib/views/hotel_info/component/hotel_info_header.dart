import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class HotelInfoHeader extends StatelessWidget {
  final String hotelName;
  final List<String> tags;
  final String basePrice;
  final String? nearbyInfo;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onMapTap;

  const HotelInfoHeader({
    super.key,
    required this.hotelName,
    required this.tags,
    required this.basePrice,
    this.nearbyInfo,
    this.isFavorite = false,
    this.onFavoriteTap,
    this.onMapTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleRow(),
          const SizedBox(height: 12),
          if (tags.isNotEmpty) _buildTagsRow(),
        ],
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      children: [
        Expanded(
          child: Text(
            hotelName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),

        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: basePrice.toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              TextSpan(text: "起/晚"),
            ],
          ),
          style: TextStyle(
            color: Colors.grey,
            fontSize: textBigSize,
          ),
        ),
      ],
    );
  }

  Widget _buildTagsRow() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tags.map((tag) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          child: Text(
            "$tag |",
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        );
      }).toList(),
    );
  }
}
