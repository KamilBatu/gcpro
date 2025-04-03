// a function that capitalizes the first letter of a string
String capitalize(String s) {
  if (s.isEmpty) {
    return s;
  }
  final words = s.split(" ");

  return words.map((word) {
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join(" ");
}
