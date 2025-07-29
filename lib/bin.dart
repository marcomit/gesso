import 'package:gesso/gesso.dart';
import 'package:gesso/src/cursor.dart';

void main(List<String> args) {
  final c = Cursor();
  Gesso().red.set();
  c.move(10, 10);
  c.font('DOWN');
  c.move(0, 40);
}
