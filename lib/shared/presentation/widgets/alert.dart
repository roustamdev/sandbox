import 'dart:ui';

import 'package:eds_test/shared/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'alert_close_button.dart';

class AppAlert {
  AppAlert._();
  static dynamic show(
    BuildContext context, {
    required String title,
    String? content,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    showDialog<void>(
      context: context,
      barrierColor: AppColors.blue.withOpacity(0.5),
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            elevation: 0,
            actionsPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            icon: const AlertCloseButton(),
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            content: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(width: 327),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (content != null)
                        Text(
                          content,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      Row(
                        children: [
                          const Spacer(),
                          if (actions != null) ...actions,
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
