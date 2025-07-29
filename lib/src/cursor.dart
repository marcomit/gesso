import 'dart:io';

part 'fonts.dart';

class Cursor {
  static final String _seq = '\x1B';
  int x = 0;
  int y = 0;

  void clear() {
    stdout.write("$_seq[2J");
    x = 0;
    y = 0;
    _setPosition();
  }

  void _setPosition() => stdout.write("$_seq[$y;${x}H");

  void move(int x, int y) {
    this.x = x;
    this.y = y;
    _setPosition();
  }

  void font(String text, [String family = 'shadow']) {
    if (!_fonts.containsKey(family)) return;
    text = text.toUpperCase();
    for (int i = 0; i < text.length; i++) {
      _printChar(text.codeUnitAt(i), _fonts[family]!);
    }
  }

  void _printChar(int char, Map<int, List<String>> map) {
    if (!map.containsKey(char)) return;
    final letter = map[char]!;
    int maxLen = 0;
    for (final line in letter) {
      print(line);
      if (maxLen < line.length) maxLen = line.length;
      move(x, y + 1);
    }
    move(x + maxLen + 1, y - letter.length);
  }
}
