import 'package:flutter/cupertino.dart';

const Duration _kExpand = Duration(milliseconds: 150);

class ExpandableView extends StatefulWidget {
  final List<Widget> children;
  final bool expand;
  final ValueChanged<bool> onExpandChanged;

  const ExpandableView(
      {Key key,
      this.onExpandChanged,
      this.children = const <Widget>[],
      this.expand = false})
      : super(key: key);

  @override
  _ExpandableViewState createState() => _ExpandableViewState();
}

class _ExpandableViewState extends State<ExpandableView>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  AnimationController _controller;
  Animation<double> _heightFactor;
  bool _expand;

  List<Widget> get children => widget.children;

  ValueChanged<bool> get onExpandChanged => widget.onExpandChanged;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _expand = widget.expand;
    if (_expand) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onClick() {
    setState(() {
      _expand = widget.expand;
      if (_expand) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((value) {
          if (!mounted) {
            return;
          }
        });
      }

      PageStorage.of(context)?.writeState(context, _expand);
    });

    if (onExpandChanged != null) {
      onExpandChanged(_expand);
    }
  }

  @override
  Widget build(BuildContext context) {
    _onClick();
    final bool closed = !_expand && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      child: closed
          ? null
          : Column(
              children: children,
            ),
      builder: _builderChildren,
    );
  }

  Widget _builderChildren(BuildContext context, Widget child) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRect(
            child: Align(
              heightFactor: _heightFactor.value,
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
