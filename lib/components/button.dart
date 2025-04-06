import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool disabled;
  final String variant;
  final double? width;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = 'primary',
    this.icon,
    this.disabled = false,
    this.width,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isPrimary = variant == 'primary';
    final isSecondary = variant == 'secondary';
    final isTertiary = variant == 'tertiary';

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: width,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? const Color(0xFF00C4CC)
              : isSecondary
              ? Colors.white
              : const Color(0xFFF8F9FA),
          foregroundColor: isPrimary
              ? Colors.white
              : const Color(0xFF00C4CC),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isSecondary
                ? const BorderSide(color: Color(0xFF00C4CC), width: 2)
                : BorderSide.none,
          ),
          elevation: isPrimary && !disabled ? 5 : 0,
          shadowColor: Colors.black26,
        ),
        child: isLoading
            ? const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 20,
                color: isPrimary ? Colors.white : const Color(0xFF00C4CC),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isPrimary ? Colors.white : const Color(0xFF00C4CC),
              ),
            ),
          ],
        ),
      ),
    );
  }
}