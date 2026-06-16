import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class HotelInfoHeader extends StatelessWidget {
  final String hotelName;
  final String? rankText;
  final String? consumerCount;
  final List<String> tags;
  final double rating;
  final int reviewCount;
  final String address;
  final String? nearbyInfo;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onMapTap;

  const HotelInfoHeader({
    super.key,
    required this.hotelName,
    this.rankText,
    this.consumerCount,
    required this.tags,
    required this.rating,
    required this.reviewCount,
    required this.address,
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
          _buildRankTags(),
          const SizedBox(height: 12),
          if (tags.isNotEmpty)
            _buildTagsRow(),
          const SizedBox(height: 16),
          _buildInfoRow(),
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

      ],
    );
  }

  Widget _buildRankTags() {
    return Row(
      children: [
        if (rankText != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                const Icon(Icons.home, color: Colors.white, size: 12),
                const SizedBox(width: 4),
                Text(
                  rankText!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        if (rankText != null && consumerCount != null)
          const SizedBox(width: 12),
        if (consumerCount != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              consumerCount!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            tag,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildInfoRow() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (nearbyInfo != null)
                  Text(
                    nearbyInfo!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: colorWhite,
                    ),
                  ),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 12,
                    color: colorBlack,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        InkWell(
          onTap: onMapTap,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.map_outlined, color: Colors.white, size: 24),
                SizedBox(height: 4),
                Text(
                  '地图',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}