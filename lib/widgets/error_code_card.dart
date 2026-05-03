import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../models/error_code_model.dart';

/// Grid card for a single AC error code
class ErrorCodeCard extends StatelessWidget {
  final ErrorCodeModel errorCode;

  const ErrorCodeCard({super.key, required this.errorCode});

  Color get _severityColor {
    switch (errorCode.severity) {
      case ErrorSeverity.low:
        return const Color(0xFF16A34A);
      case ErrorSeverity.medium:
        return const Color(0xFFD97706);
      case ErrorSeverity.high:
        return const Color(0xFFDC2626);
    }
  }

  Color get _severityBg {
    switch (errorCode.severity) {
      case ErrorSeverity.low:
        return const Color(0xFFDCFCE7);
      case ErrorSeverity.medium:
        return const Color(0xFFFEF3C7);
      case ErrorSeverity.high:
        return const Color(0xFFFEE2E2);
    }
  }

  String get _severityLabel {
    switch (errorCode.severity) {
      case ErrorSeverity.low:
        return 'Low';
      case ErrorSeverity.medium:
        return 'Medium';
      case ErrorSeverity.high:
        return 'High';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _severityColor.withOpacity(0.25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Code + severity badge
          Row(
            children: [
              Text(
                errorCode.code,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: _severityBg,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  _severityLabel,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: _severityColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(errorCode.title, style: AppTextStyles.titleSmall),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              errorCode.description,
              style: AppTextStyles.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
         const SizedBox(height: 8),
          // Divider + fix prompt
          const Divider(height: 16, color: AppColors.divider),
          Row(
            children: [
              Icon(
                Icons.build_circle_outlined,
                size: 13,
                color: AppColors.primary,
              ),
              const SizedBox(width: 4),
              Text(
                'Needs technician',
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
