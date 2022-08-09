import 'package:pdf/widgets.dart';

class DocumentText {
  final String _title;
  final String _value;
  final double? _width;
  final TextStyle? _titleStyle;
  final bool _unite;

  const DocumentText(
      this._title, this._value, this._width, this._titleStyle, this._unite);

  Widget build() {
    final style = _titleStyle ?? TextStyle(fontWeight: FontWeight.bold);
    final width = _width ?? double.infinity;

    return SizedBox(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(_title, style: style)),
          Text(_value, style: _unite ? style : null),
        ],
      ),
    );
  }
}
