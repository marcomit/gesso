import 'package:gesso/gesso.dart';

void main() {
  final g = Gesso().bold.italic.red;
  gPrint(String s) => g(s);

  gPrint('pippo');
}

