

extension PrepareNameForSearch on String {
  String prepareForSearch() {
    final prepared = StringBuffer();
    String char;
    for (var charCode in runes) {
      char = String.fromCharCode(charCode).toLowerCase();
      prepared.write(getMappedChar(char));
    }

    return prepared.toString().trim();
  }
}

String getMappedChar(String char) {
  return searchMap[char] == null ? char : searchMap[char] as String;
}

final searchMap = {
  'أ': 'ا',
  'إ': 'ا',
  'ّا': 'ا',
  'ّّ': 'ا',
  'ة': 'ه',
};
