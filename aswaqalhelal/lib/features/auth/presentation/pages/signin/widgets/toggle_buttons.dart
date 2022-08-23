import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final double width;
  final double height;

  final String leftDescription;
  final String rightDescription;

  final Color toggleColor;
  final Color toggleBackgroundColor;
  final Color toggleBorderColor;

  final Color activeTextColor;
  final Color inActiveTextColor;

  final double _leftToggleAlign = -1;
  final double _rightToggleAlign = 1;

  final VoidCallback onLeftToggleActive;
  final VoidCallback onRightToggleActive;

  const ToggleButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.toggleBackgroundColor,
      required this.toggleBorderColor,
      required this.toggleColor,
      required this.inActiveTextColor,
      required this.activeTextColor,
      required this.leftDescription,
      required this.rightDescription,
      required this.onLeftToggleActive,
      required this.onRightToggleActive})
      : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  double _toggleXAlign = 1;

  late Color _leftDescriptionColor;
  late Color _rightDescriptionColor;

  @override
  void initState() {
    super.initState();

    _leftDescriptionColor = widget.inActiveTextColor;
    _rightDescriptionColor = widget.activeTextColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.toggleBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: AlignmentDirectional(_toggleXAlign, 0),
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: widget.width * 0.42,
              height: widget.height,
              decoration: BoxDecoration(
                  color: widget.toggleColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.2), blurRadius: 10)
                  ]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (_toggleXAlign == -1) return;
                  setState(
                    () {
                      _toggleXAlign = widget._leftToggleAlign;

                      _leftDescriptionColor = widget.activeTextColor;
                      _rightDescriptionColor = widget.inActiveTextColor;
                    },
                  );

                  widget.onLeftToggleActive();
                },
                child: Container(
                  width: widget.width * 0.42,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    widget.leftDescription,
                    style: TextStyle(
                        color: _leftDescriptionColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_toggleXAlign == 1) return;

                  setState(
                    () {
                      _toggleXAlign = widget._rightToggleAlign;

                      _leftDescriptionColor = widget.inActiveTextColor;
                      _rightDescriptionColor = widget.activeTextColor;
                    },
                  );

                  widget.onRightToggleActive();
                },
                child: Container(
                  width: widget.width * 0.42,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    widget.rightDescription,
                    style: TextStyle(
                        color: _rightDescriptionColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
