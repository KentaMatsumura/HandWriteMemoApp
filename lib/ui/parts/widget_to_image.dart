import 'package:flutter/material.dart';
import 'package:handwrite_memo_app/model/key_model.dart';
import 'package:provider/provider.dart';

class WidgetToImage extends StatefulWidget {
  final Function(GlobalKey key) builder;

  const WidgetToImage({
    @required this.builder,
    Key key,
  }) : super(key: key);

  @override
  _WidgetToImageState createState() => _WidgetToImageState();
}

class _WidgetToImageState extends State<WidgetToImage> {
  final globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final pageKey = Provider.of<KeyModel>(context);

    return RepaintBoundary(
      key: globalKey,
      child: widget.builder(globalKey),
      // key: pageKey.key,
      // child: widget.builder(pageKey.key),
    );
  }
}
