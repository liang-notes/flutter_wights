import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;
  final bool expand;

  const ExpandableText(
      {Key key, this.text, this.maxLines, this.style, this.expand = false})
      : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  String get text => widget.text;
  int get maxLines => widget.maxLines;
  TextStyle get style => widget.style;
  bool _expand;

  @override
  void initState() {
    super.initState();
    _expand = widget.expand;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final span = TextSpan(text: text ?? '', style: style);
        final textPainter = TextPainter(
          text: span,
          maxLines: maxLines,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: size.maxWidth);

        if (textPainter.didExceedMaxLines) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _expand
                  ? Text(text ?? '', style: style)
                  : Text(text ?? '',
                      style: style,
                      maxLines: maxLines,
                      overflow: TextOverflow.ellipsis),
              GestureDetector(
                child: Container(
                  child: Text(
                    _expand ? '收起' : '全文',
                    style: TextStyle(
                        fontSize: style != null ? style.fontSize : null,
                        color: Colors.blue),
                  ),
                ),
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    _expand = !_expand;
                  });
                },
              )
            ],
          );
        } else {
          return Text(
            text ?? '',
            style: style,
          );
        }
      },
    );
  }
}
