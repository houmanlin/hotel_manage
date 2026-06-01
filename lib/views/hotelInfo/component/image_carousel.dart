import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;
  final List<String>? imageLabels;
  final String title;
  final bool showSearch;
  final bool showFavorite;
  final bool showShare;
  final ValueChanged<int>? onPageChanged;

  const ImageCarousel({
    super.key,
    required this.images,
    this.imageLabels,
    this.title = '',
    this.showSearch = true,
    this.showFavorite = true,
    this.showShare = true,
    this.onPageChanged,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_buildImageSlider(), _buildTopBar(), _buildBottomBar()],
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: 280,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.images.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
          widget.onPageChanged?.call(index);
        },
        itemBuilder: (context, index) {
          return Image.network(
            widget.images[index],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[200],
                child: const Center(
                  child: Icon(Icons.broken_image, color: Colors.grey),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildTopBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.1),
              Colors.transparent,
            ],
          ),
        ),
        child: Row(
          children: [
            if (widget.title.isNotEmpty)
              Expanded(
                child: Row(
                  children: [
                    GestureDetector(
                      child: SizedBox(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 12),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            const Spacer(),
            if (widget.showSearch)
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white, size: 24),
                onPressed: () {},
              ),
            if (widget.showFavorite)
              IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {},
              ),
            if (widget.showShare)
              IconButton(
                icon: const Icon(
                  Icons.share_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {},
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.2),
              Colors.transparent,
            ],
          ),
        ),
        child: Column(
          children: [
            _buildLabels(),
            const SizedBox(height: 8),
            _buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildLabels() {
    if (widget.imageLabels == null || widget.imageLabels!.isEmpty) {
      return const SizedBox.shrink();
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.imageLabels!.asMap().entries.map((entry) {
          int index = entry.key;
          String label = entry.value;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: index == _currentIndex
                    ? Colors.white
                    : Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: index == _currentIndex ? Colors.black : Colors.white,
                  fontSize: 12,
                  fontWeight: index == _currentIndex
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '${_currentIndex + 1}/${widget.images.length}',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right, color: Colors.white, size: 28),
          onPressed: () {
            if (_currentIndex < widget.images.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          },
        ),
      ],
    );
  }
}
