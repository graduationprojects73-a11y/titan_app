import 'package:flutter/material.dart';

class BrandColors {
  // الكحلي الأساسي (لون كلمة TITAN)
  static const Color navy = Color(0xFF1C2A5A);

  // الأزرق المتوسط (داخل خطوط الكرة)
  static const Color mediumBlue = Color(0xFF00407C);

  // الأخضر الليموني
  static const Color limeGreen = Color(0xFF73AA2A);

  // الأخضر الفاتح (لون مساعد)
  static const Color lightGreen = Color(0xFFA8C587);

  // Brand Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [navy, mediumBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient logoGradient = LinearGradient(
    colors: [navy, limeGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueGreenGradient = LinearGradient(
    colors: [mediumBlue, limeGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
