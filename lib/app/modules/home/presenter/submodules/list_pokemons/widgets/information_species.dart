import 'package:flutter/material.dart';

class InformationSpecies extends StatelessWidget {
  const InformationSpecies({
    super.key,
    required this.title,
    this.icon,
    required this.value,
  });

  final String title;
  final String? icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.labelMedium,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            if (icon != null && icon!.isNotEmpty)
              Image.asset(
                icon!,
              ),
            const SizedBox(width: 4),
            Text(
              value,
              style: textTheme.labelSmall,
            ),
          ],
        )
      ],
    );
  }
}
