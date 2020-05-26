import 'package:flutter/material.dart';

class CustomExpansionPanelList extends StatelessWidget {
  const CustomExpansionPanelList(
      {Key key,
      this.children: const <ExpansionPanel>[],
      this.expansionCallback,
      this.animationDuration: kThemeAnimationDuration})
      : assert(children != null),
        assert(animationDuration != null),
        super(key: key);

  final List<ExpansionPanel> children;

  final ExpansionPanelCallback expansionCallback;

  final Duration animationDuration;

  bool _isChildExpanded(int index) {
    return children[index].isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = <Widget>[];

    for (int index = 0; index < children.length; index += 1) {
      final Row header = new Row(
        children: <Widget>[
          new Expanded(
            child: new AnimatedContainer(
              duration: animationDuration,
              curve: Curves.fastOutSlowIn,
              child: new SizedBox(
                child: children[index].headerBuilder(
                  context,
                  children[index].isExpanded,
                ),
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsetsDirectional.only(end: 8.0),
            child: new ExpandIcon(
              isExpanded: _isChildExpanded(index),
              padding: const EdgeInsets.all(16.0),
              onPressed: (bool isExpanded) {
                if (expansionCallback != null)
                  expansionCallback(index, isExpanded);
              },
            ),
          ),
        ],
      );

      items.add(
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: new Container(
            key: new _SaltedKey<BuildContext, int>(context, index * 2),
            child: new Material(
              elevation: 1,
              borderRadius: new BorderRadius.all(new Radius.circular(17)),
              child: new Column(
                children: <Widget>[
                  header,
                  new AnimatedCrossFade(
                    firstChild: new Container(height: 0.0),
                    secondChild: children[index].body,
                    firstCurve:
                        const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                    secondCurve:
                        const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                    sizeCurve: Curves.fastOutSlowIn,
                    crossFadeState: _isChildExpanded(index)
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: animationDuration,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return new Column(
      children: items,
    );
  }
}

class _SaltedKey<S, V> extends LocalKey {
  const _SaltedKey(this.salt, this.value);

  final S salt;
  final V value;

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final _SaltedKey<S, V> typedOther = other;
    return salt == typedOther.salt && value == typedOther.value;
  }

  @override
  int get hashCode => hashValues(runtimeType, salt, value);

  @override
  String toString() {
    final String saltString = S == String ? '<\'$salt\'>' : '<$salt>';
    final String valueString = V == String ? '<\'$value\'>' : '<$value>';
    return '[$saltString $valueString]';
  }
}
