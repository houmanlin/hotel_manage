import 'package:flutter/material.dart';
import 'package:hotel_manage/util/media_query_utils.dart';

class ChatMessageList extends StatelessWidget {
  final List<Map<String, dynamic>> messages;
  final ScrollController scrollController;

  const ChatMessageList({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  Widget _buildMessageItem(Map<String, dynamic> message, BuildContext context) {
    bool isSent = message['type'] == 'sent';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: isSent ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment:
                isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: isSent ? ScreenUtil.screenWidth * 0.65 : ScreenUtil.screenWidth - 42,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: isSent ? const Color(0xFF4A9D7C) : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: isSent ? const Radius.circular(12) : const Radius.circular(0),
                    bottomRight: isSent ? const Radius.circular(0) : const Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Text(
                  message['content'],
                  style: TextStyle(
                    color: isSent ? Colors.white : Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              if (isSent)
                Text(
                  message['time'],
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return _buildMessageItem(messages[index], context);
        },
      ),
    );
  }
}