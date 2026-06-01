import 'package:flutter/material.dart';
import 'package:hotel_manage/components/app_bar.dart';
import 'package:hotel_manage/components/app_home_bar.dart';
import 'package:hotel_manage/components/waterfall_flow.dart';
import 'component/class_status/class_status.dart';
import 'component/search_creator/search_creator.dart';

class CreationPage extends StatefulWidget {
  const CreationPage({super.key});

  @override
  State<CreationPage> createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(),
      body: Stack(
        children: [
          SearchCreator(),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 20),
            child: ListView(
              children: [
                WaterfallFlow(
                  items: [
                    WaterfallFlowItem(
                      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80',
                      title: '苍山洱海：慢生活的终极定义苍山洱海：慢生活的终极定义苍山洱海：慢生活的终极定义苍山洱海：慢生活的终极定义苍山洱海：慢生活的终极定义苍山洱海：慢生活的终极定义苍山洱海：慢生活的终极定义',
                      author: '阿苏老奶',
                      tag: '大理',
                      likes: 1256,
                      comments: 42,
                    ),
                    WaterfallFlowItem(
                      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80',
                      title: '苍山洱海：慢生活的终极定义',
                      author: '阿苏老奶',
                      tag: '大理',
                      likes: 1256,
                      comments: 42,
                    ),
                    WaterfallFlowItem(
                      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80',
                      title: '苍山洱海：慢生活的终极定义',
                      author: '阿苏老奶',
                      tag: '大理',
                      likes: 1256,
                      comments: 42,
                    ),
                    WaterfallFlowItem(
                      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80',
                      title: '苍山洱海：慢生活的终极定义',
                      author: '阿苏老奶',
                      tag: '大理',
                      likes: 1256,
                      comments: 42,
                    ),
                    WaterfallFlowItem(
                      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80',
                      title: '苍山洱海：慢生活的终极定义',
                      author: '阿苏老奶',
                      tag: '大理',
                      likes: 1256,
                      comments: 42,
                    ),
                    WaterfallFlowItem(
                      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80',
                      title: '苍山洱海：慢生活的终极定义',
                      author: '阿苏老奶',
                      tag: '大理',
                      likes: 1256,
                      comments: 42,
                    ),
                    WaterfallFlowItem(
                      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80',
                      title: '苍山洱海：慢生活的终极定义',
                      author: '阿苏老奶',
                      tag: '大理',
                      likes: 1256,
                      comments: 42,
                    ),
                    WaterfallFlowItem(
                      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80',
                      title: '苍山洱海：慢生活的终极定义',
                      author: '阿苏老奶',
                      tag: '大理',
                      likes: 1256,
                      comments: 42,
                    ),
                    WaterfallFlowItem(
                      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80',
                      title: '苍山洱海：慢生活的终极定义',
                      author: '阿苏老奶',
                      tag: '大理',
                      likes: 1256,
                      comments: 42,
                    ),
                    WaterfallFlowItem(
                      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80',
                      title: '苍山洱海：慢生活的终极定义',
                      author: '阿苏老奶',
                      tag: '大理',
                      likes: 1256,
                      comments: 42,
                    ),
                    WaterfallFlowItem(
                      imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=300&q=80',
                      title: '苍山洱海：慢生活的终极定义',
                      author: '阿苏老奶',
                      tag: '大理',
                      likes: 1256,
                      comments: 42,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
