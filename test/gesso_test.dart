import 'package:test/test.dart';
import 'package:gesso/gesso.dart';

void main() {
  group('Gesso Core', () {
    test('should create empty instance with no styling', () {
      final g = Gesso();
      expect(g('test'), equals('test'));
    });

    test('should create instance from existing codes', () {
      final g = Gesso.from([1, 31]);
      expect(g('test'), equals('\x1B[1;31mtest\x1B[0m'));
    });

    test('should add custom ANSI codes', () {
      final g = Gesso().and(91);
      expect(g('test'), equals('\x1B[91mtest\x1B[0m'));
    });

    test('should validate ANSI code range', () {
      final g = Gesso();
      expect(() => g.and(-1), throwsArgumentError);
      expect(() => g.and(256), throwsArgumentError);
      expect(() => g.and(0), returnsNormally);
      expect(() => g.and(255), returnsNormally);
    });

    test('should add styles using enum', () {
      final g = Gesso().add(GessoStyle.bold);
      expect(g('test'), equals('\x1B[1mtest\x1B[0m'));
    });

    test('should be immutable', () {
      final g1 = Gesso();
      final g2 = g1.red;
      final g3 = g1.blue;

      expect(g1('test'), equals('test'));
      expect(g2('test'), equals('\x1B[31mtest\x1B[0m'));
      expect(g3('test'), equals('\x1B[34mtest\x1B[0m'));
    });
  });

  group('Text Styling', () {
    late Gesso g;

    setUp(() {
      g = Gesso();
    });

    test('should apply bold styling', () {
      expect(g.bold('test'), equals('\x1B[1mtest\x1B[0m'));
    });

    test('should apply dim styling', () {
      expect(g.dim('test'), equals('\x1B[2mtest\x1B[0m'));
    });

    test('should apply italic styling', () {
      expect(g.italic('test'), equals('\x1B[3mtest\x1B[0m'));
    });

    test('should apply underline styling', () {
      expect(g.underline('test'), equals('\x1B[4mtest\x1B[0m'));
    });

    test('should apply blink styling', () {
      expect(g.blink('test'), equals('\x1B[5mtest\x1B[0m'));
    });

    test('should apply rapid blink styling', () {
      expect(g.blinkRapid('test'), equals('\x1B[6mtest\x1B[0m'));
    });

    test('should apply reversed styling', () {
      expect(g.reversed('test'), equals('\x1B[7mtest\x1B[0m'));
    });

    test('should apply hidden styling', () {
      expect(g.hidden('test'), equals('\x1B[8mtest\x1B[0m'));
    });

    test('should apply strikethrough styling', () {
      expect(g.strikethrough('test'), equals('\x1B[9mtest\x1B[0m'));
    });
  });

  group('Standard Colors', () {
    late Gesso g;

    setUp(() {
      g = Gesso();
    });

    test('should apply standard foreground colors', () {
      expect(g.black('test'), equals('\x1B[30mtest\x1B[0m'));
      expect(g.red('test'), equals('\x1B[31mtest\x1B[0m'));
      expect(g.green('test'), equals('\x1B[32mtest\x1B[0m'));
      expect(g.yellow('test'), equals('\x1B[33mtest\x1B[0m'));
      expect(g.blue('test'), equals('\x1B[34mtest\x1B[0m'));
      expect(g.magenta('test'), equals('\x1B[35mtest\x1B[0m'));
      expect(g.cyan('test'), equals('\x1B[36mtest\x1B[0m'));
      expect(g.white('test'), equals('\x1B[37mtest\x1B[0m'));
    });

    test('should apply bright foreground colors', () {
      expect(g.brightBlack('test'), equals('\x1B[90mtest\x1B[0m'));
      expect(g.brightRed('test'), equals('\x1B[91mtest\x1B[0m'));
      expect(g.brightGreen('test'), equals('\x1B[92mtest\x1B[0m'));
      expect(g.brightYellow('test'), equals('\x1B[93mtest\x1B[0m'));
      expect(g.brightBlue('test'), equals('\x1B[94mtest\x1B[0m'));
      expect(g.brightMagenta('test'), equals('\x1B[95mtest\x1B[0m'));
      expect(g.brightCyan('test'), equals('\x1B[96mtest\x1B[0m'));
      expect(g.brightWhite('test'), equals('\x1B[97mtest\x1B[0m'));
    });
  });

  group('Background Colors', () {
    late Gesso g;

    setUp(() {
      g = Gesso();
    });

    test('should apply standard background colors', () {
      expect(
        g.background(GessoColor.black)('test'),
        equals('\x1B[40mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.red)('test'),
        equals('\x1B[41mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.green)('test'),
        equals('\x1B[42mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.yellow)('test'),
        equals('\x1B[43mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.blue)('test'),
        equals('\x1B[44mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.magenta)('test'),
        equals('\x1B[45mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.cyan)('test'),
        equals('\x1B[46mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.white)('test'),
        equals('\x1B[47mtest\x1B[0m'),
      );
    });

    test('should apply bright background colors', () {
      expect(
        g.background(GessoColor.black, true)('test'),
        equals('\x1B[100mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.red, true)('test'),
        equals('\x1B[101mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.green, true)('test'),
        equals('\x1B[102mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.yellow, true)('test'),
        equals('\x1B[103mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.blue, true)('test'),
        equals('\x1B[104mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.magenta, true)('test'),
        equals('\x1B[105mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.cyan, true)('test'),
        equals('\x1B[106mtest\x1B[0m'),
      );
      expect(
        g.background(GessoColor.white, true)('test'),
        equals('\x1B[107mtest\x1B[0m'),
      );
    });
  });

  group('Foreground Color Methods', () {
    late Gesso g;

    setUp(() {
      g = Gesso();
    });

    test('should apply foreground colors using method', () {
      expect(
        g.foreground(GessoColor.red)('test'),
        equals('\x1B[31mtest\x1B[0m'),
      );
      expect(
        g.foreground(GessoColor.blue)('test'),
        equals('\x1B[34mtest\x1B[0m'),
      );
    });

    test('should apply bright foreground colors using method', () {
      expect(
        g.foreground(GessoColor.red, true)('test'),
        equals('\x1B[91mtest\x1B[0m'),
      );
      expect(
        g.foreground(GessoColor.blue, true)('test'),
        equals('\x1B[94mtest\x1B[0m'),
      );
    });
  });

  group('Style Chaining', () {
    late Gesso g;

    setUp(() {
      g = Gesso();
    });

    test('should chain multiple text styles', () {
      expect(g.bold.italic('test'), equals('\x1B[1;3mtest\x1B[0m'));
      expect(g.underline.strikethrough('test'), equals('\x1B[4;9mtest\x1B[0m'));
    });

    test('should chain colors and styles', () {
      expect(g.red.bold('test'), equals('\x1B[31;1mtest\x1B[0m'));
      expect(
        g.blue.italic.underline('test'),
        equals('\x1B[34;3;4mtest\x1B[0m'),
      );
    });

    test('should chain foreground and background colors', () {
      expect(
        g.red.background(GessoColor.yellow)('test'),
        equals('\x1B[31;43mtest\x1B[0m'),
      );
    });

    test('should handle complex chaining', () {
      final styled = g.brightRed.bold.underline.background(
        GessoColor.blue,
        true,
      );
      expect(styled('test'), equals('\x1B[91;1;4;104mtest\x1B[0m'));
    });

    test('should maintain order in chaining', () {
      final style1 = g.red.bold.underline;
      final style2 = g.bold.red.underline;

      // Different order should produce different ANSI sequences
      expect(style1('test'), equals('\x1B[31;1;4mtest\x1B[0m'));
      expect(style2('test'), equals('\x1B[1;31;4mtest\x1B[0m'));
    });
  });

  group('Equality and Hash Code', () {
    test('should be equal when codes are the same', () {
      final g1 = Gesso().red.bold;
      final g2 = Gesso().red.bold;

      expect(g1, equals(g2));
      expect(g1.hashCode, equals(g2.hashCode));
    });

    test('should not be equal when codes are different', () {
      final g1 = Gesso().red.bold;
      final g2 = Gesso().blue.bold;

      expect(g1, isNot(equals(g2)));
    });

    test('should be equal regardless of creation method', () {
      final g1 = Gesso().and(31).and(1);
      final g2 = Gesso().red.bold;

      expect(g1, equals(g2));
    });

    test('should handle empty instances', () {
      final g1 = Gesso();
      final g2 = Gesso();

      expect(g1, equals(g2));
      expect(g1.hashCode, equals(g2.hashCode));
    });
  });

  group('toString Method', () {
    test('should display codes correctly', () {
      final g = Gesso().red.bold;
      expect(g.toString(), contains('codes:'));
      expect(g.toString(), contains('[31, 1]'));
    });

    test('should handle empty instance', () {
      final g = Gesso();
      expect(g.toString(), contains('codes: []'));
    });
  });

  group('Edge Cases', () {
    test('should handle empty text', () {
      final g = Gesso().red;
      expect(g(''), equals('\x1B[31m\x1B[0m'));
    });

    test('should handle text with newlines', () {
      final g = Gesso().red;
      expect(g('line1\nline2'), equals('\x1B[31mline1\nline2\x1B[0m'));
    });

    test('should handle text with special characters', () {
      final g = Gesso().red;
      expect(g('héllo wörld! 🌍'), equals('\x1B[31mhéllo wörld! 🌍\x1B[0m'));
    });

    test('should handle very long style chains', () {
      final g = Gesso()
          .red
          .bold
          .italic
          .underline
          .blink
          .background(GessoColor.yellow)
          .and(100);

      expect(g('test'), contains('\x1B[31;1;3;4;5;43;100mtest\x1B[0m'));
    });
  });

  group('Performance', () {
    test('should create many instances efficiently', () {
      final stopwatch = Stopwatch()..start();

      for (int i = 0; i < 1000; i++) {
        final g = Gesso().red.bold.underline;
        g('test $i');
      }

      stopwatch.stop();
      // Should complete reasonably quickly (adjust threshold as needed)
      expect(stopwatch.elapsedMilliseconds, lessThan(1000));
    });

    test('should handle reused styles efficiently', () {
      final errorStyle = Gesso().red.bold;
      final stopwatch = Stopwatch()..start();

      for (int i = 0; i < 1000; i++) {
        errorStyle('Error $i');
      }

      stopwatch.stop();
      expect(stopwatch.elapsedMilliseconds, lessThan(100));
    });
  });

  group('Enum Values', () {
    test('should have correct GessoStyle values', () {
      expect(GessoStyle.bold.value, equals(1));
      expect(GessoStyle.dim.value, equals(2));
      expect(GessoStyle.italic.value, equals(3));
      expect(GessoStyle.underline.value, equals(4));
      expect(GessoStyle.blink.value, equals(5));
      expect(GessoStyle.blinkRapid.value, equals(6));
      expect(GessoStyle.reversed.value, equals(7));
      expect(GessoStyle.hidden.value, equals(8));
      expect(GessoStyle.strikethrough.value, equals(9));
    });

    test('should have correct GessoColor values', () {
      expect(GessoColor.black.value, equals(0));
      expect(GessoColor.red.value, equals(1));
      expect(GessoColor.green.value, equals(2));
      expect(GessoColor.yellow.value, equals(3));
      expect(GessoColor.blue.value, equals(4));
      expect(GessoColor.magenta.value, equals(5));
      expect(GessoColor.cyan.value, equals(6));
      expect(GessoColor.white.value, equals(7));
    });
  });
}
