import 'package:flutter/material.dart';

// Common app button following design system
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonType type;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _getBackgroundColor(),
        foregroundColor: _getForegroundColor(),
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(text),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case ButtonType.primary:
        return const Color(0xFF0077B6); // Primary blue
      case ButtonType.secondary:
        return const Color(0xFFFF6B6B); // Coral red
      case ButtonType.outline:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor() {
    switch (type) {
      case ButtonType.primary:
      case ButtonType.secondary:
        return Colors.white;
      case ButtonType.outline:
        return const Color(0xFF0077B6);
    }
  }
}

enum ButtonType { primary, secondary, outline }
