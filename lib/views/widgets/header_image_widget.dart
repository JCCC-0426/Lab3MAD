import 'package:flutter/material.dart';

/// Hero banner image with a caption label. Falls back to a gradient
/// if the image cannot be loaded (e.g. offline).
class HeaderImageWidget extends StatelessWidget {
  final String imageUrl;
  final String caption;
  final double height;

  const HeaderImageWidget({
    super.key,
    required this.imageUrl,
    required this.caption,
    this.height = 220,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => _fallback(),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                caption,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fallback({bool showSpinner = false}) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF3F51B5), Color(0xFF00796B)],
        ),
      ),
      child: Center(
        child: showSpinner
            ? const CircularProgressIndicator(color: Colors.white)
            : const Icon(Icons.directions_boat, size: 64, color: Colors.white70),
      ),
    );
  }
}