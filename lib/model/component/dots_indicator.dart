import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  final PageController controller;

  final int itemCount;

  final ValueChanged<int> onPageSelected;

  final Color color;

  static const double _kDotSize = 8.0;

  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    return new Container(
      width: _kDotSpacing,
      height: 12,
      child: new Center(
        child: new Material(
          color: index == controller.page ? color : Colors.white54,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize,
            height: _kDotSize,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}