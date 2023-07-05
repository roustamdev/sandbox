import 'package:eds_test/shared/presentation/theme/app_colors.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class AlertCloseButton extends StatelessWidget {
  const AlertCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          const Spacer(),
          InputChip(
            onPressed: () => Navigator.of(context).pop(),
            padding: EdgeInsets.zero,
            backgroundColor: AppColors.gray,
            label: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              height: 32,
              width: 40,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  EneftyIcons.close_outline,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
