/// Performs modifications of a given string to fit certain format.
class StringUtils {
  /// Returns the capitalized version of the [capitalizedString] parameter.
  static String capitalizeString(var capitalizedString) {
    return "${capitalizedString[0].toUpperCase()}${capitalizedString.substring(1).toLowerCase()}";
  }
}
