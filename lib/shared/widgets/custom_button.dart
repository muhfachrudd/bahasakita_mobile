import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final List<Color>? gradient;
  final double? width;
  final Widget? icon;

  final double? height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.gradient,
    this.width,
    this.height,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: gradient != null ? LinearGradient(colors: gradient!) : null,
        color: gradient == null ? (color ?? AppColors.indigo700) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
