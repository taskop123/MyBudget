import 'package:pdf/widgets.dart';

/// Widget which creates a a full sized box text for the document to be exported.
class DocumentText {
  /// The title of the document text.
  final String _title;

  /// The value of the document text.
  final String _value;

  /// The width of the document text sized box widget.
  final double? _width;

  /// The title style of the document text sized box widget.
  final TextStyle? _titleStyle;

  /// Defines whether the text of the document will be visually united or not.
  final bool _unite;

  /// Creates a new instance of [DocumentText]
  /// with a specific [_title], [_value], [_width], [_titleStyle],
  /// as well as a [_unite] flag.
  const DocumentText(
      this._title, this._value, this._width, this._titleStyle, this._unite);

  /// The [TextStyle] of the document text widget to be created.
  TextStyle _getStyle() {
    return _titleStyle ?? TextStyle(fontWeight: FontWeight.bold);
  }

  Widget build() {
    return SizedBox(
      width: _width ?? double.infinity,
      child: Row(
        children: [
          Expanded(
              child: Text(
            _title,
            style: _getStyle(),
          )),
          Text(_value, style: _unite ? _getStyle() : null),
        ],
      ),
    );
  }
}
