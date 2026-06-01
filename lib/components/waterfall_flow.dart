import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hotel_manage/util/system_params.dart';

class WaterfallFlowItem {
  final String imageUrl;
  final String title;
  final String author;
  final String? tag;
  final int likes;
  final int comments;

  WaterfallFlowItem({
    required this.imageUrl,
    required this.title,
    required this.author,
    this.tag,
    this.likes = 0,
    this.comments = 0,
  });
}

class WaterfallFlow extends StatelessWidget {
  final List<WaterfallFlowItem> items;
  final void Function(WaterfallFlowItem item)? onTap;

  const WaterfallFlow({super.key, required this.items, this.onTap});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(
        items.length,
        (index) => StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 3,
          child: _buildItem(items[index], context),
        ),
      ),
    );
  }

  Widget _buildItem(WaterfallFlowItem item, BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(item),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(containerRadian),
          color: colorWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(containerRadian),
                  ),
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 210,
                  ),
                ),
                if (item.tag != null) _buildTag(item.tag!),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:65,
                    child: Text(
                      item.title,
                      style: TextStyle(
                        fontSize: textBigSize,
                        color: colorBlack,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(containerCircle),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 12,
                          color: Colors.grey[400],
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          item.author,
                          style: TextStyle(
                            fontSize: textSmallSize,
                            color: Colors.grey[500],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 14,
                            color: Colors.red[400],
                          ),
                          SizedBox(width: 2),
                          Text(
                            _formatNumber(item.likes),
                            style: TextStyle(
                              fontSize: textSmallSize,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.more_horiz, size: 16, color: Colors.grey[400]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String tag) {
    return Positioned(
      top: 8,
      left: 8,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(containerCircle),
        ),
        child: Row(
          children: [
            Icon(Icons.location_on, size: 10, color: primaryColor),
            SizedBox(width: 2),
            Text(
              tag,
              style: TextStyle(fontSize: textSmallSize, color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  String _formatNumber(int number) {
    if (number >= 10000) {
      return '${(number / 10000).toStringAsFixed(1)}w';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }
}
