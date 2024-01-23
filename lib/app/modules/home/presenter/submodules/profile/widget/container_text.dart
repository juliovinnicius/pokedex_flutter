import 'package:flutter/material.dart';

import '../../../../../../core/themes/theme_colors.dart';

class ContainerText extends StatelessWidget {
  const ContainerText({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 20,
        left: 24,
        right: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.labelMedium!.copyWith(
              color: ThemeColors.darkGray,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 11),
            decoration: BoxDecoration(
              color: ThemeColors.almostWhite,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              message,
              style: textTheme.bodySmall!.copyWith(
                color: ThemeColors.gray31,
              ),
            ),
          )
        ],
      ),
    );
  }
}
