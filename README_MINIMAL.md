# dart_source_builder

Composable Dart source-code generation with typed builders.

## Install

```bash
dart pub add dart_source_builder
```

## Example

```dart
import 'package:dart_source_builder/dart_source_builder.dart';

void main() {
  final file = File(lines: [
    Import(importPath: 'dart:io'),
    FunctionDefinition(
      name: 'main',
      lines: [
        Line(
          FunctionCall(
            functionName: 'print',
            positionalArguments: [StringBuilder('Hello from generated code')],
          ),
        ),
      ],
    ),
  ]);

  print(file.build());
}
```

## Includes

- Declarations: `Class`, `FunctionDefinition`, `ConstructorBuilder`, `Factory`
- Expressions: `FunctionCall`, `Comparison`, `BooleanOperation`, `StringBuilder`
- Types/params: `TypeBuilder`, `GenericParametersDefinition`, parameter builders
- File/module nodes: `File`, `Import`, `Export`, `Part`, `PartOf`

## More docs

- Full guide: `README.md`
- Complete API reference: `docs/API_REFERENCE.md`
