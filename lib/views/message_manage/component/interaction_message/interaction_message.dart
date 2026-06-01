import 'package:flutter/material.dart';
import 'package:hotel_manage/util/system_params.dart';

class InteractionMessage extends StatelessWidget {
  final String? avatarUrl;
  final String username;
  final String action;
  final String? photoUrl;
  final String? comment;
  final String time;

  const InteractionMessage({
    super.key,
    this.avatarUrl,
    required this.username,
    required this.action,
    this.photoUrl,
    this.comment,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(containerRadian),
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(left: 6),
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(containerRadian),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAvatar(),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  SizedBox(height: 8),
                  _buildContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: colorGrey,
        borderRadius: BorderRadius.circular(containerCircle),
      ),
      child: avatarUrl != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(containerCircle),
              child: Image.network(avatarUrl!, fit: BoxFit.cover),
            )
          : Icon(Icons.person, size: 24, color: Colors.grey[400]),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: username,
                  style: TextStyle(
                    fontSize: textTitleSize,
                    fontWeight: FontWeight.bold,
                    color: colorBlack,
                  ),
                ),
                TextSpan(
                  text: ' 赞了您在 ',
                  style: TextStyle(fontSize: textSize, color: colorBlack),
                ),
                TextSpan(
                  text: action,
                  style: TextStyle(fontSize: textSize, color: primaryColor),
                ),
                TextSpan(
                  text: ' 中的照片。',
                  style: TextStyle(fontSize: textSize, color: colorBlack),
                ),
              ],
            ),
          ),
        ),
        Text(
          time,
          style: TextStyle(fontSize: textSmallSize, color: Colors.grey[400]),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(containerSmallRadian),
      ),
      child: Row(
        children: [
          if (photoUrl != null)
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(containerSmallRadian),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(containerSmallRadian),
                child: Image.network(
                  photoUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.photo, size: 24, color: Colors.grey[400]);
                  },
                ),
              ),
            )
          else
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(containerSmallRadian),
              ),
              child: Icon(Icons.photo, size: 24, color: Colors.grey[400]),
            ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              comment ?? '',
              style: TextStyle(fontSize: textSize, color: colorBlack),
            ),
          ),
        ],
      ),
    );
  }
}
