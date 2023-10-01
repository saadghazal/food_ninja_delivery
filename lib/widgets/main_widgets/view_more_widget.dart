import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/custom_styles.dart';

class ViewMore extends StatelessWidget {
  const ViewMore({
    required this.onTap,
    required this.functionalityName,
    Key? key,
  }) : super(key: key);
  final VoidCallback onTap;
  final String functionalityName;
  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            functionalityName,
            style: headerText.copyWith(
              fontSize: 16,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              side: BorderSide.none,
              padding: EdgeInsets.zero,
              foregroundColor: viewMoreColor.withOpacity(0.2),
            ),
            clipBehavior: Clip.hardEdge,
            onPressed: onTap,
            child: const Text(
              'View More',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: viewMoreColor,
              ),
            ),
          ),
        ],

    );
  }
}
