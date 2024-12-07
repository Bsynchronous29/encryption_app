enum Cipher {
  caeser,
  atbash,
  vigenere,
}

enum Encryption {
  decrypt,
  encrypt,
}

List<String> getEnums(List<dynamic> enumValues) {
  List<String> enums = [];

  // Iterate through the enum values
  for (var value in enumValues) {
    enums.add(formatEnum(value));
  }

  return enums;
}

String formatEnum(dynamic enumValue) {
  // Convert the enum value to a string and format it
  String temp = enumValue.toString().split('.').last;

  // Split words based on camel case and join them with a space
  String formatted = temp.replaceAllMapped(
    RegExp(r'(?<=[a-z])(?=[A-Z])'),
    (match) => ' ',
  );

  // Capitalize the first letter
  formatted = formatted.substring(0, 1).toUpperCase() + formatted.substring(1);

  return formatted;
}
