# Gesso 🎨

A lightweight, chainable terminal styling library for Dart that makes your console output beautiful and expressive.

## Features

- 🔗 **Chainable API** - Combine multiple styles fluently
- 🎨 **Rich Styling** - Colors, backgrounds, text decorations
- 🚀 **Lightweight** - Zero dependencies, minimal footprint
- 💪 **Type Safe** - Full Dart type safety with enums
- 🎯 **Production Ready** - Robust error handling and validation

## Installation

Add `gesso` to your `pubspec.yaml`:

```yaml
dependencies:
  gesso: ^1.0.0
```

## Quick Start

```dart
import 'package:gesso/gesso.dart';

void main() {
  final gesso = Gesso();
  
  // Simple styling
  print(gesso.red('Error: Something went wrong!'));
  print(gesso.green.bold('✓ Success!'));
  
  // Chainable styling
  print(gesso
    .blue
    .bold
    .underline('Important Notice'));
    
  // Background colors
  print(gesso
    .white
    .background(GessoColor.red)
    ('ALERT'));
}
```

## API Reference

### Core Class: `Gesso`

The main class for creating styled terminal output.

#### Constructors

```dart
Gesso()              // Creates a new instance
Gesso.from(codes)    // Creates from existing ANSI codes
```

#### Text Styling Methods

All methods return a new `Gesso` instance for chaining:

- `bold()` - Bold text
- `dim()` - Dimmed text
- `italic()` - Italic text
- `underline()` - Underlined text
- `blink()` - Blinking text
- `blinkRapid()` - Rapid blinking text
- `reversed()` - Reversed colors
- `hidden()` - Hidden text
- `strikethrough()` - Strikethrough text

#### Color Methods

**Foreground Colors:**
- `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`
- `brightBlack`, `brightRed`, `brightGreen`, etc.

**Advanced Color Methods:**
```dart
foreground(GessoColor color, [bool bright = false])
background(GessoColor color, [bool bright = false])
```

#### Applying Styles

```dart
String call(String text)  // Apply all styles to text
```

### Enums

#### `GessoStyle`
Defines text styling options:
```dart
enum GessoStyle {
  bold(1),
  dim(2),
  italic(3),
  underline(4),
  blink(5),
  blinkRapid(6),
  reversed(7),
  hidden(8),
  strikethrough(9)
}
```

#### `GessoColor`
Defines available colors:
```dart
enum GessoColor {
  black(0),
  red(1),
  green(2),
  yellow(3),
  blue(4),
  magenta(5),
  cyan(6),
  white(7)
}
```

## Usage Examples

### Basic Styling

```dart
final g = Gesso();

// Single styles
print(g.red('Error message'));
print(g.bold('Important text'));
print(g.underline('Underlined text'));
```

### Combining Styles

```dart
final g = Gesso();

// Chain multiple styles
print(g.red.bold.underline('Critical Error!'));
print(g.green.italic('Success message'));
print(g.blue.background(GessoColor.yellow)('Highlighted'));
```

### Color Variations

```dart
final g = Gesso();

// Standard colors
print(g.red('Standard red'));
print(g.brightRed('Bright red'));

// Using color methods
print(g.foreground(GessoColor.red)('Red text'));
print(g.foreground(GessoColor.red, true)('Bright red text'));
print(g.background(GessoColor.blue)('Blue background'));
```

### Advanced Usage

```dart
final g = Gesso();

// Create reusable styles
final errorStyle = g.red.bold;
final successStyle = g.green.bold;
final warningStyle = g.yellow.italic;

print(errorStyle('Error: File not found'));
print(successStyle('✓ Operation completed'));
print(warningStyle('⚠ Warning: Low disk space'));

// Complex combinations
final headerStyle = g
  .white
  .bold
  .background(GessoColor.blue);
  
print(headerStyle(' APPLICATION HEADER '));
```

### Building Custom Styles

```dart
final g = Gesso();

// Add individual style codes
final customStyle = g
  .add(GessoStyle.bold)
  .add(GessoStyle.underline)
  .with(91); // Custom ANSI code

print(customStyle('Custom styled text'));
```

## Best Practices

### 1. Reuse Style Objects
```dart
// Good: Create once, use multiple times
final errorStyle = Gesso().red.bold;
print(errorStyle('Error 1'));
print(errorStyle('Error 2'));

// Avoid: Creating new instances repeatedly
print(Gesso().red.bold('Error 1'));
print(Gesso().red.bold('Error 2'));
```

### 2. Semantic Styling
```dart
final g = Gesso();

// Define semantic styles
final success = g.green.bold;
final error = g.red.bold;
final warning = g.yellow;
final info = g.blue;

// Use semantic names
print(success('Operation completed'));
print(error('Failed to connect'));
```

### 3. Terminal Compatibility
```dart
// Check terminal support before using advanced features
final g = Gesso();

if (Platform.environment['TERM'] != 'dumb') {
  print(g.brightBlue.italic('Fancy output'));
} else {
  print('Simple output');
}
```

## ANSI Escape Codes

Gessetto uses standard ANSI escape sequences:
- Text styles: 1-9
- Foreground colors: 30-37, 90-97
- Background colors: 40-47, 100-107
- Reset: 0

## Browser Support

While primarily designed for terminal applications, Gesso's output will display as plain text in browsers (ANSI codes are ignored).

## Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Submit a pull request

## License

MIT License - see LICENSE file for details.

## Changelog

### v1.0.0
- Initial release
- Full ANSI color and style support
- Chainable API
- Production-ready implementationrom the package authors, and more.
