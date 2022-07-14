import '../core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

const _avatarSize = 48.0;

class Avatar extends StatelessWidget {
  const Avatar({Key? key, this.photo, this.onTap}) : super(key: key);

  final String? photo;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final photo = this.photo;
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: Ink.image(
        image: (photo == null
            ?  const AssetImage(ImageAssets.profile)
            : NetworkImage(photo)) as ImageProvider,
        fit: BoxFit.cover,
        width: 100,
        height: 100,
        child: InkWell(
          onTap: onTap,
        ),
      ),
    );
  }
}
