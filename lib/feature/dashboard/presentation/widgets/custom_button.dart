import 'package:flutter/material.dart';
import 'package:pethan_portfolio/core/constants/app_colors.dart';
import 'package:pethan_portfolio/core/utils/app_extensions.dart';

enum ButtonType { filled, outline }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.type = ButtonType.filled,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    final isFilled = widget.type == ButtonType.filled;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          onHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          onHover = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            color: isFilled ? AppColors.gold : Colors.transparent,
            borderRadius: BorderRadius.circular(200),
            border: Border.all(
              color: isFilled ? AppColors.gold : AppColors.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text.toUpperCase(),
                style: TextStyle(
                  color: isFilled ? Colors.black : AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onHover
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: 16,
                      color: AppColors.background,
                    )
                  : 8.w,
              AnimatedRotation(
                turns: onHover ? 0 : -0.25,
                duration: const Duration(milliseconds: 250),
                child: Transform.rotate(
                  angle: onHover ? 0 : 0.7,
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: isFilled ? AppColors.background : AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
