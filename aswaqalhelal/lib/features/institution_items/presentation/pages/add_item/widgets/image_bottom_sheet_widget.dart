import 'package:flutter/material.dart';

class ImageBottomSheetWidget extends StatelessWidget {
  const ImageBottomSheetWidget({
    Key? key,
    required this.onCameraPressed,
    required this.onGalleryPressed,
  }) : super(key: key);
  final VoidCallback onCameraPressed;
  final VoidCallback onGalleryPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(builder: (context, constrains) {
        return Row(
          children: [
            _SquaredContainerButton(
              dimension: constrains.maxWidth / 2 - 8,
              iconData: Icons.camera_alt,
              label: 'Take Photo',
              onPressed: onCameraPressed,
            ),
            const SizedBox(width: 16),
            _SquaredContainerButton(
              dimension: constrains.maxWidth / 2 - 8,
              iconData: Icons.image_rounded,
              label: 'Gallery',
              onPressed: onGalleryPressed,
            )
          ],
        );
      }),
    );
  }
}

class _SquaredContainerButton extends StatelessWidget {
  const _SquaredContainerButton({
    Key? key,
    required this.dimension,
    required this.iconData,
    required this.label,
    required this.onPressed,
  }) : super(key: key);
  final double dimension;
  final IconData iconData;
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: Material(
        color: const Color(0xFFEDEEF0),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onPressed,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
              Text(
                label,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
