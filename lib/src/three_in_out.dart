import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpinKitThreeInOut extends StatefulWidget {
  const SpinKitThreeInOut({
    Key key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 700),
    this.controller,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitThreeInOutState createState() => _SpinKitThreeInOutState();
}

class _SpinKitThreeInOutState extends State<SpinKitThreeInOut>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  List<Widget> _widgets;

  double _lastAnim = 0;

  @override
  void initState() {
    super.initState();

    // Create a extra element which is used for the show/hide animation.
    _widgets = List.generate(
      4,
      (i) => SizedBox.fromSize(
        size: Size.square(widget.size * 0.5),
        child: _itemBuilder(i),
      ),
    );

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();

    _controller.addListener(() {
      if (_lastAnim > _controller.value) {
        setState(() => _widgets.insert(0, _widgets.removeLast()));
      }

      _lastAnim = _controller.value;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 2, widget.size),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _widgets
              .asMap()
              .map((index, value) {
                Widget innerWidget = value;

                if (index == 0) {
                  innerWidget = _wrapInAnimatedBuilder(innerWidget);
                }

                if (index == 3) {
                  innerWidget = _wrapInAnimatedBuilder(
                    innerWidget,
                    inverse: true,
                  );
                }

                return MapEntry<int, Widget>(index, innerWidget);
              })
              .values
              .toList(),
        ),
      ),
    );
  }

  AnimatedBuilder _wrapInAnimatedBuilder(
    Widget innerWidget, {
    bool inverse = false,
  }) =>
      AnimatedBuilder(
        animation: _controller,
        child: innerWidget,
        builder: (context, inn) {
          final value = inverse ? 1 - _controller.value : _controller.value;
          return SizedBox.fromSize(
            size: Size.square(widget.size * 0.5 * value),
            child: Opacity(child: inn, opacity: value),
          );
        },
      );

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder(context, index)
      : DecoratedBox(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle));
}
