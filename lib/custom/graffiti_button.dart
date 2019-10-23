import 'package:flutter/material.dart';

class GraffitiButton extends StatefulWidget {
  final bool activated;
  final Function onTap;
  final String promptText;
  final Color mainColor;
  final Color silentMainColor;
  final Color backgroundColor;
  final Color silentBackgroundColor;

  GraffitiButton({Key key,
    this.activated = false,
    this.onTap,
    this.promptText = '涂鸦风格按钮',
    this.mainColor = const Color(0xFFFF6B47),
    this.silentMainColor = const Color(0xFFB2B2B2),
    this.backgroundColor = const Color(0xFFD95636),
    this.silentBackgroundColor = const Color(0xFF8A8A8A)})
      : super(key: key);

  @override
  _GraffitiButtonState createState() => _GraffitiButtonState();
}

class _GraffitiButtonState extends State<GraffitiButton> {
  bool get activated => widget.activated;

  Function get onTap => widget.onTap;

  String get promptText => widget.promptText;

  Color get backgroundColor => widget.backgroundColor;
  Color get silentBackgroundColor => widget.silentBackgroundColor;

  Color get mainColor => widget.mainColor;
  Color get silentMainColor => widget.silentMainColor;

  Alignment mainContainerAlignment = Alignment.topCenter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: activated
          ? () {
        setState(() {
          // TODO: 第4步：实现“主要矩形”，“按下”按钮。
          mainContainerAlignment = Alignment.bottomCenter;
          onTap();
          // TODO: 第4步：实现“主要矩形”，“松开”按钮。
          mainContainerAlignment = Alignment.topCenter;
        });
      }
          : null,
      child: SizedBox(
        height: 48,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                    color: activated ? backgroundColor : silentBackgroundColor,
                  border: Border.all(
                    width: 2.0,
                    color: const Color(0xFF282828),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
              ),
            ),

            Align(
              alignment: mainContainerAlignment,
              child: Container(
                height: 42,
                child: Center(
                  child: Text(promptText,
                    style: TextStyle(
                      color: const Color(0xFF282828),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: activated ? mainColor : silentMainColor,
                  border: Border.all(
                    width: 2.0,
                    color: const Color(0xFF282828),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}
