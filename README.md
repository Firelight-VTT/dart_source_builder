# dart_source_builder

`dart_source_builder` is a composable source-generation DSL for Dart.

It helps you build Dart code using typed objects instead of manual string
concatenation. You compose builders for declarations, expressions, control flow,
types, and files, then call `build()` to render deterministic source code.

## What this package provides

- Typed AST-like builders for Dart source generation.
- Strong composition of expressions, lines, declarations, and files.
- Reusable parameter/type builders for function and constructor signatures.
- Utility builders for imports, exports, annotations, and comments.
- Lightweight indentation handling for nested generation.

## Installation

Add the package:

```bash
dart pub add dart_source_builder
```

or in `pubspec.yaml`:

```yaml
dependencies:
	dart_source_builder: ^0.0.81
```

Then run:

```bash
dart pub get
```

## Why use it

- You want readable generation code instead of brittle string templates.
- You need programmatic control over function/class/type construction.
- You want predictable output from composable, testable builders.

## Quick start

### 1) Build a small file

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
						positionalArguments: [
							StringBuilder('Hello from generated code'),
						],
					),
				),
			],
		),
	]);

	print(file.build());
}
```

### 2) Build a class with constructor and method

```dart
import 'package:dart_source_builder/dart_source_builder.dart';

final model = Class(
	name: 'User',
	lines: [
		Initialization(
			isFinal: true,
			type: TypeBuilder.string(),
			targetName: 'name',
		),
		ConstructorBuilder(
			name: 'User',
			parameters: [
				PositionalParameterDefinition(name: 'name', isThis: true),
			],
		),
		FunctionDefinition(
			name: 'greet',
			returnType: TypeBuilder.string(),
			lines: [
				Return(StringBuilder('Hello, $name')),
			],
		),
	],
);

print(model.build());
```

### 3) Build expression trees

```dart
final condition = BooleanOperation(
	left: Comparison(
		left: Literal('count'),
		operator: ComparisonOperator.greaterThan,
		right: Literal('0'),
	),
	operator: BooleanOperator.and,
	right: Negation(statement: Literal('isLocked')),
);

print(condition.build()); // count > 0 && !isLocked
```

## Core concepts

- `SourceBuilder` is the root renderable abstraction.
- `BaseStatement` is used for expression-like constructs.
- `Line` wraps renderables into semicolon-terminated statement lines.
- `File` is a top-level container for ordered output lines.

## API map

- File/module: `File`, `Import`, `Export`, `Part`, `PartOf`, `Library`
- Declarations: `Class`, `Mixin`, `EnumBuilder`, `FunctionDefinition`,
	`ConstructorBuilder`, `Factory`, `Getter`, `Setter`
- Parameters/types: `TypeBuilder`, `GenericParametersDefinition`,
	`PositionalParameterDefinition`, `OptionalPositionalParameterDefinition`,
	`NamedParameterDefinition`
- Expressions: `FunctionCall`, `Literal`, `StringBuilder`, `Text`, `Const`,
	`Await`, `As`, `Is`, `Comparison`, `BooleanOperation`, `Negation`,
	`Substitution`, `Parens`, `ListBuilder`, `SetBuilder`, `MapBuilder`
- Flow and statements: `If`, `ElseIf`, `Else`, `For`, `Switch`, `Return`,
	`Break`, `Continue`, `Exit`, `Initialization`, `Static`
- Comments and spacing: `CommentLine`, `CommentDocLine`, `EmptyLine`

## API documentation

For complete per-file and per-symbol documentation, see:

- `docs/API_REFERENCE.md`

The API reference includes architecture notes, behavioral details, and a
walkthrough of the existing test composition.

## Testing

The repository contains an integration-style generation test in
`test/dart_source_builder_test.dart` that assembles a realistic output file
from many builders.

Run tests with:

```bash
flutter test
```

## Design notes

- Most builders are intentionally lightweight and composable.
- Output formatting is deterministic but minimal; running `dart format` on
	generated files is recommended when desired.
- Indentation is managed via a shared indentation utility during rendering.

## Contributing

Contributions are welcome. If you add a new builder:

- Export it from `lib/dart_source_builder.dart`.
- Add inline Dartdoc for public declarations.
- Extend `docs/API_REFERENCE.md`.
- Add or update tests in `test/`.
