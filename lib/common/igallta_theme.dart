import 'package:flutter/material.dart';

class IgalltaTheme {
  static const Color abyssalVoid = Color(0xFF07080C);     // Chapter VI Ark Mirage deep void
  static const Color obsidianCard = Color(0xCC0E121B);    // Translucent obsidian surface
  static const Color glitchCrimson = Color(0xFFD91E36);   // Glitch crimson primary accent
  static const Color porcelainSilver = Color(0xFFDCE3EC); // Porcelain silver text & highlights
  static const Color steelBorder = Color(0xFF283044);     // 1px metallic border

  static ThemeData buildDarkTheme() {
    const colorScheme = ColorScheme.dark(
      primary: glitchCrimson,
      onPrimary: Color(0xFFF8FAFC),
      primaryContainer: Color(0xFF3D0B16),
      onPrimaryContainer: Color(0xFFFFD9DF),
      secondary: Color(0xFF94A3B8),
      onSecondary: abyssalVoid,
      surface: Color(0xFF0B0E16),
      onSurface: porcelainSilver,
      surfaceContainerLow: obsidianCard,
      surfaceContainer: Color(0xD9121724),
      surfaceContainerHigh: Color(0xE6181F30),
      outline: steelBorder,
      outlineVariant: Color(0xFF1E2536),
      error: Color(0xFFFF3B5C),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: abyssalVoid,
      dividerTheme: const DividerThemeData(color: steelBorder, thickness: 1),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: porcelainSilver,
      ),
    );
  }
}

class IgalltaBackgroundWrapper extends StatelessWidget {
  final Widget child;
  const IgalltaBackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: IgalltaTheme.abyssalVoid,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.16,
            child: Image.asset(
              'assets/images/igallta_bg.png',
              fit: BoxFit.cover,
              alignment: Alignment.center,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.1,
                colors: [
                  Colors.transparent,
                  IgalltaTheme.abyssalVoid.withOpacity(0.85),
                ],
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
