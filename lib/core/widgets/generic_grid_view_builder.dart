import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/extensions/context_extensions.dart';

class GenericGridViewBuilder<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;

  const GenericGridViewBuilder({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.crossAxisCount = 3,
    this.crossAxisSpacing = 20,
    this.mainAxisSpacing = 20,
    this.childAspectRatio = 2.1,
    this.padding,
    this.shrinkWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: shrinkWrap,
      physics: const NeverScrollableScrollPhysics(),
      padding: padding ?? const EdgeInsets.all(20),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isTabletSize ? 2 : 3,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return itemBuilder(items[index]);
      },
    );
  }
}
