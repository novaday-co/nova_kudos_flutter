import 'package:flutter/material.dart';

class CustomSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;

  const CustomSliverPersistentHeader({
    required this.child,
    this.maxHeight = 72,
  });

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => maxHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Center(child: child);
  }
}
