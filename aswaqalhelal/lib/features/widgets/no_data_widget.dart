import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_svg.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/vectors/empty.svg',
          width: MediaQuery.of(context).size.width / 1.5,
        ),
        const SizedBox(height: 8),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}
