import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_leaf/src/common/constants/app_dimensions.dart';
import 'package:daily_leaf/src/common/theme/theme_extension.dart';

abstract final class SupportMethods {
  static Future<void> showBottomSheet({
    required BuildContext context,
    required Widget child,
    String? sheetTitle,
    TextStyle? titleStyle,
    bool useCloseButton = true,
    Color barrierColor = kCupertinoModalBarrierColor,
  }) async {
    return showModalBottomSheet(
      context: context,
      barrierColor: barrierColor,
      backgroundColor: context.theme.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.large,
            right: AppDimensions.large,
            bottom:
                MediaQuery.of(sheetContext).viewInsets.bottom +
                AppDimensions.extraLarge,
          ),
          child: Material(
            color: context.theme.backgroundColor,
            borderRadius: BorderRadius.circular(
              AppDimensions.largeBorderRadius,
            ),
            clipBehavior: Clip.antiAlias,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(
                  AppDimensions.large,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (sheetTitle != null || useCloseButton) ...[
                      Row(
                        children: [
                          if (sheetTitle != null)
                            Expanded(
                              child: Text(
                                sheetTitle,
                                style:
                                    titleStyle ??
                                    context.themeData.textTheme.titleLarge
                                        ?.copyWith(
                                          color: context.theme.primaryTextColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                              ),
                            ),
                          if (useCloseButton)
                            IconButton(
                              onPressed: () =>
                                  Navigator.of(sheetContext).maybePop(),
                              icon: const Icon(
                                Icons.close_rounded,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: AppDimensions.medium),
                    ],
                    child,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
