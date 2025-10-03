import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/app_colors.dart';

class ArabicTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign textAlign;

  const ArabicTextWidget({
    super.key,
    required this.text,
    this.fontSize = 24,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.amiri(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? AppColors.textArabic,
        height: 2.0, // Better line spacing for Arabic text
      ),
      textDirection: TextDirection.rtl,
      textAlign: textAlign,
    );
  }
}