import 'package:flutter/material.dart';
import 'package:hotel_manage/components/app_bar.dart';
import 'package:hotel_manage/components/chat_message_list.dart';

class AiDialog extends StatefulWidget {
  const AiDialog({super.key});

  @override
  State<AiDialog> createState() => _AiDialogState();
}

class _AiDialogState extends State<AiDialog> {
  final List<Map<String, dynamic>> _messages = [
    {
      'type': 'received',
      'content': '您好！请问有什么可以帮您的？',
      'time': '10:30',
    },
    {
      'type': 'sent',
      'content': '你好，我想咨询一下酒店预订的问题你好，我想咨询一下酒店预订的问题你好，我想咨询一下酒店预订的问题你好，我想咨询一下酒店预订的问题你好，我想咨询一下酒店预订的问题你好，我想咨询一下酒店预订的问题你好，我想咨询一下酒店预订的问题',
      'time': '10:31',
    },
    {
      'type': 'received',
      'content': '当然可以！请问您想预订哪家酒店？需要什么时间段的房间呢？？需要什么时间段的房间呢？',
      'time': '10:32',
    },
    {
      'type': 'sent',
      'content': '我想预订下周末的房间，最好是靠近市中心的',
      'time': '10:33',
    },
    {
      'type': 'received',
      'content': '好的，我来帮您查询一下。请问您需要几间房？几位入住呢？',
      'time': '10:34',
    },
    {
      'type': 'received',
      'content': '好的，我来帮您查询一下。请问您需要几间房？几位入住呢？',
      'time': '10:34',
    },
    {
      'type': 'received',
      'content': '好的，我来帮您查询一下。请问您需要几间房？几位入住呢？',
      'time': '10:34',
    },
    {
      'type': 'received',
      'content': '好的，我来帮您查询一下。请问您需要几间房？几位入住呢？',
      'time': '10:34',
    },
    {
      'type': 'received',
      'content': '好的，我来帮您查询一下。请问您需要几间房？几位入住呢？',
      'time': '10:34',
    },
    {
      'type': 'received',
      'content': '好的，我来帮您查询一下。请问您需要几间房？几位入住呢？',
      'time': '10:34',
    },
    {
      'type': 'received',
      'content': '好的，我来帮您查询一下。请问您需要几间房？几位入住呢？',
      'time': '10:34',
    },
    {
      'type': 'received',
      'content': '好的，我来帮您查询一下。请问您需要几间房？几位入住呢？',
      'time': '10:34',
    },
    {
      'type': 'received',
      'content': '好的，我来帮您查询一下。请问您需要几间房？几位入住呢？',
      'time': '10:34',
    },
  ];

  final TextEditingController _inputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    if (_inputController.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'type': 'sent',
        'content': _inputController.text.trim(),
        'time': DateTime.now().hour.toString().padLeft(2, '0') +
            ':' +
            DateTime.now().minute.toString().padLeft(2, '0'),
      });
    });

    _inputController.clear();

    Future.delayed(const Duration(milliseconds: 500), () {
      _scrollToBottom();
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add({
          'type': 'received',
          'content': '好的，我已经为您记录了需求，正在查询合适的酒店...',
          'time': DateTime.now().hour.toString().padLeft(2, '0') +
              ':' +
              DateTime.now().minute.toString().padLeft(2, '0'),
        });
      });

      Future.delayed(const Duration(milliseconds: 500), () {
        _scrollToBottom();
      });
    });
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '智能助手',
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        trailing: IconButton(
          icon: const Icon(Icons.phone),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          ChatMessageList(
            messages: _messages,
            scrollController: _scrollController,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _inputController,
                      decoration: const InputDecoration(
                        hintText: '输入消息...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      onSubmitted: (value) => _sendMessage(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4A9D7C),
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}