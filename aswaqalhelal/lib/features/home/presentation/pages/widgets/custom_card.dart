import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.padding,
    this.mainAxisSize,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    required this.children,
    this.onTap,
    this.backgroundColor = Colors.white,
  }) : super(key: key);
  final MainAxisSize? mainAxisSize;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final List<Widget> children;
  final EdgeInsets? padding;
  final GestureTapCallback? onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffECEDF1),
              spreadRadius: 4,
              blurRadius: 6,
            ),
          ],
        ),
        child: Padding(
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            mainAxisSize: mainAxisSize ?? MainAxisSize.min,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
