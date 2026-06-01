import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          _buildHeader(),
          _buildReviewItem(),
          _buildReviewItem(),
          _buildReviewItem(),
          _buildReviewItem(),
          _buildReviewItem(),
          _buildReviewItem(),
          _buildExpandButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF0F0F0))),
      ),
      child: Row(
        children: [
          const Text(
            '评论',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              '326条',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const Text(
                '推荐排序',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.grey, size: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF0F0F0))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserInfo(),
          const SizedBox(height: 12),
          _buildRating(),
          const SizedBox(height: 12),
          _buildReviewContent(),
          const SizedBox(height: 12),
          _buildReviewImages(),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange[200],
          ),
          child: const Icon(Icons.person, color: Colors.orange, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    '龙太郎',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Lv.2',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5E6D3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      '图享',
                      style: TextStyle(fontSize: 10, color: Colors.orange),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      '图享3年',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text(
                    '已消费 · 城景高级双床房(大床房/双床房任...',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '现场评价',
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Text(
          '2025-11-19',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              color: index < 5 ? Colors.yellow : Colors.grey,
              size: 16,
            );
          }),
        ),
        const SizedBox(width: 4),
        const Text(
          '超赞',
          style: TextStyle(fontSize: 12, color: Colors.orange),
        ),
      ],
    );
  }

  Widget _buildReviewContent() {
    return const Text(
      '酒店干净卫生，新装修没异味隔音不错，床及床品舒服，灯光明亮空调安静，窗外风景美丽，服务员热情，去各个景点景点也很方便，早少也比较丰富，总的来...全',
      style: TextStyle(
        fontSize: 14,
        color: Colors.black87,
        height: 1.5,
      ),
    );
  }

  Widget _buildReviewImages() {
    return Row(
      children: [
        _buildReviewImage(0),
        const SizedBox(width: 8),
        _buildReviewImage(1),
        const SizedBox(width: 8),
        _buildReviewImage(2),
      ],
    );
  }

  Widget _buildExpandButton() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '更多评论',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Icon(Icons.chevron_right, color: Colors.grey, size: 16),
          ],
        )
    );
  }

  Widget _buildReviewImage(int index) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(
              _getImageUrl(index),
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  String _getImageUrl(int index) {
    const images = [
      'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=200&q=80',
      'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=200&q=80',
      'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=200&q=80',
      'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=200&q=80',
    ];
    return images[index];
  }
}