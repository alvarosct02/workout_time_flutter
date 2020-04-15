import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppButton extends StatelessWidget {
  final Function onClick;
  final String label;
  final Color color;
  final double radius;
  final bool enable;
  final double height = 60;

  AppButton(
      {@required this.label,
      @required this.onClick,
      this.radius: 8,
      this.enable: true,
      this.color});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color ?? Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Container(
          height: height,
          child: Center(child: Text(label, style: TextStyle(fontSize: 16)))),
      onPressed: !this.enable? null : onClick,
    );
  }
}

class AppIconButton extends StatelessWidget {
  final Function onClick;
  final Widget icon;
  final Color color;
  final double radius;
  final double height = 60;

  AppIconButton(
      {@required this.icon,
      @required this.onClick,
      this.radius: 8,
      this.color});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      child: Container(
        height: height,
        child: Center(child: icon),
      ),
      constraints: BoxConstraints(),
      elevation: 0,
      highlightElevation: 0,
      fillColor: color ?? Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class AppBackButton extends StatelessWidget {
  final Function onClick;
  final Color color;
  final double radius;

  AppBackButton({@required this.onClick, this.radius: 0, this.color});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(),
      onPressed: () {},
      child: new Icon(
        Icons.arrow_back_ios,
        size: 24.0,
      ),
      shape: new CircleBorder(),
      padding: const EdgeInsets.all(16.0),
    );
  }
}

class ScrollViewWithHeight extends StatelessWidget {
  final Widget child;

  const ScrollViewWithHeight({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: child,
      ),
    );
  }
}
