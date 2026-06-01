import 'package:flutter/material.dart';
import 'package:hotel_manage/api/model/withdrawCard/withdrawCard.dart';
import 'package:hotel_manage/util/system_params.dart';


class WithdrawCardList extends StatelessWidget {

  final List<WithdrawCard> withdrawCardList;


  const WithdrawCardList({
    super.key,
    this.withdrawCardList = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(withdrawCardList.length, (index) => _buildWithdrawCardItem(withdrawCardList[index])),
    );
  }

  Widget _buildWithdrawCardItem(WithdrawCard item) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(containerRadian),
      ),
      child: Row(
        children: [
          _buildImage(item.imageUrl),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(item.title),
                SizedBox(height: 6),
                _buildDescription(item.description),
                SizedBox(height: 8),
                _buildTags(item.tags),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(containerRadian),
      child: Image.network(
        imageUrl,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: textTitleSize,
        fontWeight: FontWeight.bold,
        color: colorBlack,
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: TextStyle(
        fontSize: textSize,
        color: colorDescription,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTags(List<Tag> tags) {
    return Row(
      children: tags
          .map((tag) =>
          Container(
            margin: EdgeInsets.only(right: 6),
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: tag.backgroundColor,
              borderRadius: BorderRadius.circular(containerSmallRadian),
            ),
            child: Text(
              tag.name,
              style: TextStyle(
                fontSize: textSmallSize,
                color: tag.textColor,
              ),
            ),
          ))
          .toList(),
    );
  }
}
