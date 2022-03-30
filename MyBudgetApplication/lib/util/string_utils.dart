class StringUtils {
  static String capitalizeString(var capitalizedString) {
    return "${capitalizedString[0].toUpperCase()}${capitalizedString.substring(1).toLowerCase()}";
  }
}
