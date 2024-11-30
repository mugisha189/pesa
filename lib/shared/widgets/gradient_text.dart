import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;
  final bool underline;

  const GradientText({
    required this.text,
    required this.style,
    required this.gradient,
    this.underline = false,
  });

  @override
  Widget build(BuildContext context) {
    // Create a TextPainter to measure the text width
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout(); // Lay out the text to calculate its width

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        if (underline)
          Positioned(
            bottom: 0, // Position the underline just below the text
            child: Container(
              height: 2.0, // Thickness of the underline
              width: textPainter.width, // Use the calculated text width
              decoration: BoxDecoration(
                gradient: gradient, // Apply the gradient to the underline
              ),
            ),
          ),
        ShaderMask(
          shaderCallback: (bounds) => gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(
            text,
            style: style.copyWith(color: Colors.white), // Text color must be white
          ),
        ),
      ],
    );
  }
}
