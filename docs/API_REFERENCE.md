# API Reference

This document describes all code in this repository, including every source file
under `lib/src`, the package entrypoint exports, and the existing test.

## Package structure

- `lib/dart_source_builder.dart`: Barrel export for the public API.
- `lib/src/`: Core builders and helper types.
- `lib/src/internals/`: Internal shared primitives used by public builders.
- `test/dart_source_builder_test.dart`: End-to-end usage example test.

## Core abstractions

### `lib/src/internals/source_builder.dart`

- `SourceBuilder` (abstract)
- Contract: implement `String build()`.
- `toString()` delegates to `build()` so all builders can be interpolated safely.

### `lib/src/base_statement.dart`

- `BaseStatement` (abstract, extends `SourceBuilder`)
- Marker base class for expression-like nodes.

### `lib/src/line.dart`

- `Line` (extends `SourceBuilder`)
- Wraps a `SourceBuilder content` and emits an indented line ending in `;\n`.

### `lib/src/internals/indent.dart`

- `Indent` singleton tracks current indentation state.
- `level` and `spacesPerLevel` control indentation width.
- `indent(action)` increments indentation for the duration of `action`.
- `toString()` returns current indentation spaces.

## File/module builders

### `lib/src/file.dart`

- `File`
- Represents a full generated source file from ordered `List<Line>`.
- `build()` concatenates each line's generated output.

### `lib/src/import.dart`

- `Import`
- Emits `import` directives with optional `as`, `show`, and `hide` clauses.

### `lib/src/export.dart`

- `Export`
- Emits `export` directives with optional `show` and `hide` clauses.

### `lib/src/library.dart`

- `Library`
- Emits `library;` as a line.

### `lib/src/part.dart`

- `Part`
- Emits `part '...';`.

### `lib/src/part_of.dart`

- `PartOf`
- Emits `part of '...';`.

## Type builders and parameter builders

### `lib/src/type_builder.dart`

- `TypeBuilder`
- Builds Dart type strings with optional nullability suffix (`?`).
- Named constructors for common built-ins:
- `int`, `string`, `double`, `num`, `bool`, `dynamic`, `record`, `list`,
  `set`, `map`, `iterable`, `future`, `stream`, `object`, `voidType`,
  `nullType`, `neverType`, `custom`.
- `TypeBuilder.function(...)` builds `Function` signatures with:
- return type, generic parameters, positional/optional/named parameter lists,
  and optional `async` marker.

### `lib/src/generic_parameters_definition.dart`

- `GenericParametersDefinition`
- Emits generic type parameter lists like `<T, U>`.

### `lib/src/anon_positional_parameter_definition.dart`

- `AnonPositionalParameterDefinition`
- Defines positional parameters for anonymous functions.

### `lib/src/positional_parameter_definition.dart`

- `PositionalParameterDefinition`
- Defines named positional parameters for declarations.
- Supports `this.` and `super.` forwarding forms.

### `lib/src/optional_positional_parameter_definition.dart`

- `OptionalPositionalParameterDefinition`
- Defines optional positional parameters.
- Supports explicit type/default value and `this.` / `super.` forms.

### `lib/src/named_parameter_definition.dart`

- `NamedParameterDefinition`
- Defines named parameters, supporting:
- `required` keyword, optional default values, `this.` / `super.` forms.
- Assertion prevents invalid required+default combination.

## Expression builders

### `lib/src/literal.dart`

- `Literal`
- Wraps raw expression text and emits it unchanged.

### `lib/src/text.dart`

- `Text`
- Emits a double-quoted string literal from plain text.

### `lib/src/string_builder.dart`

- `StringBuilder`
- Emits a quoted string literal, with optional single-quote mode.

### `lib/src/list_builder.dart`

- `ListBuilder`
- Emits list literals: `[a, b, c]`.

### `lib/src/array_builder.dart`

- `ArrayBuilder`
- Functionally equivalent to `ListBuilder`; emits `[a, b, c]`.

### `lib/src/set_builder.dart`

- `SetBuilder`
- Emits set literals: `{a, b, c}`.

### `lib/src/map_builder.dart`

- `MapBuilder`
- Emits map literals from `List<KvBuilder>`.
- `KvBuilder`
- Emits individual key-value entries: `key: value`.

### `lib/src/function_named_argument.dart`

- `FunctionNamedArgument`
- Emits named arguments in calls: `name: value`.

### `lib/src/function_call.dart`

- `FunctionCall`
- Builds callable expressions with support for:
- optional target object, null-aware access (`?.` via `targetObjectMayBeNull`),
  generic argument list, positional args, and named args.

### `lib/src/super_call.dart`

- `SuperCall`
- Specialized `FunctionCall` preconfigured for `super(...)` invocations.

### `lib/src/as.dart`

- `As`
- Emits cast expressions: `(target as Type)`.

### `lib/src/is.dart`

- `Is`
- Emits type-check expressions: `target is checkedValue`.

### `lib/src/await.dart`

- `Await`
- Emits `await expression`.

### `lib/src/const.dart`

- `Const`
- Emits `const expression`.

### `lib/src/parens.dart`

- `Parens`
- Wraps an expression in parentheses.

### `lib/src/negation.dart`

- `Negation`
- Emits unary logical negation: `!expr`.

### `lib/src/boolean_operation.dart`

- `BooleanOperation`
- Emits boolean binary expressions using `BooleanOperator`.
- `BooleanOperator` enum
- Values: `and`, `or`.
- `BooleanOperatorExtension.symbol`
- Maps to `&&` and `||`.

### `lib/src/comparison.dart`

- `Comparison`
- Emits comparison expressions using `ComparisonOperator`.
- `ComparisonOperator` enum
- Values: `equal`, `notEqual`, `lessThan`, `lessThanOrEqual`,
  `greaterThan`, `greaterThanOrEqual`.
- `ComparisonOperatorExtension.symbol`
- Maps enum values to Dart operator symbols.

### `lib/src/substitution.dart`

- `Substitution`
- Emits ternary conditional expressions: `cond ? a : b`.

### `lib/src/assignment.dart`

- `Assignment`
- Emits assignment expressions: `target = rhs`.

### `lib/src/increment.dart`

- `Increment`
- Emits postfix increment: `x++`.

### `lib/src/decrement.dart`

- `Decrement`
- Emits postfix decrement: `x--`.

## Statement and control-flow builders

### `lib/src/if.dart`

- `If`
- Emits `if` blocks with either multiline body or single-line branch body.

### `lib/src/elseif.dart`

- `ElseIf`
- Emits `else if` blocks with multiline or single-line body.

### `lib/src/else.dart`

- `Else`
- Emits `else` blocks with multiline or single-line body.

### `lib/src/for.dart`

- `For`
- Supports classic `for(init; cond; update)` and `for-in` via `For.each`.

### `lib/src/switch.dart`

- `Switch`
- Emits `switch` blocks over an expression.
- `SwitchCase`
- Emits individual `case` sections and nested lines.

### `lib/src/return.dart`

- `Return`
- Emits `return expression;` with indentation.

### `lib/src/break.dart`

- `Break`
- Emits `break;`.

### `lib/src/continue.dart`

- `Continue`
- Emits `continue;`.

### `lib/src/exit.dart`

- `Exit`
- Emits `exit(code);`.

## Declaration builders

### `lib/src/class.dart`

- `Class`
- Emits class declarations with support for:
- `abstract` modifier, generic parameters, `extends`, mixins (`with`), imports,
  configurable spacing between generated members, and member `List<Line>`.

### `lib/src/mixin.dart`

- `Mixin`
- Emits mixin declarations with optional generic parameters, optional `on` type,
  and member lines.

### `lib/src/enum_builder.dart`

- `EnumBuilder`
- Emits enum declarations from a name and value list.

### `lib/src/function_definition.dart`

- `FunctionDefinition`
- Emits named function declarations with:
- optional return type (defaults to `void`), optional generic parameters,
  positional/optional/named parameters, async marker, and multiline body.

### `lib/src/anon_function_definition.dart`

- `AnonFunctionDefinition`
- Emits anonymous function expressions in multiline or single-line form.
- Supports generic parameters, parameter categories, and async marker.

### `lib/src/constructor_builder.dart`

- `ConstructorBuilder`
- Emits constructors with support for:
- generic parameters, full parameter model, optional `super(...)` initializer,
  additional initializer assignments, and either body or terminating semicolon.

### `lib/src/factory.dart`

- `Factory`
- Emits factory constructors with optional named constructor segment,
  generic parameters, full parameter model, and body lines.

### `lib/src/getter.dart`

- `Getter`
- Emits getter declarations in single-line (`=>`) or block-body form.

### `lib/src/setter.dart`

- `Setter`
- Emits setter declarations in single-line (`=>`) or block-body form.

### `lib/src/operator_overload.dart`

- `OperatorOverload`
- Emits operator overload methods with optional single argument signature
  and multiline body lines.

### `lib/src/initialization.dart`

- `Initialization`
- Emits variable declarations with optional `static`, `late`, `final`,
  optional type annotation, and optional initializer expression.

### `lib/src/static.dart`

- `Static`
- Prefix wrapper that emits `static` before an inner `Line` declaration.

### `lib/src/annotation.dart`

- `Annotation`
- Emits metadata annotations like `@Name` or `@Name(args...)`.
- Supports positional and named arguments and optional forced parentheses.

## Comment and spacing helpers

### `lib/src/comment_line.dart`

- `CommentLine`
- Emits `//` comments as lines.

### `lib/src/comment_doc_line.dart`

- `CommentDocLine`
- Emits `///` doc comment lines.

### `lib/src/empty_line.dart`

- `EmptyLine`
- Emits a blank line separator.

## Public export surface

### `lib/dart_source_builder.dart`

Exports the package's public builders from `lib/src`, including expression,
declaration, flow-control, comment, and utility types.

## Test code

### `test/dart_source_builder_test.dart`

- Contains an integration-style composition test that builds a realistic Dart
  source file with imports, function definitions, nested calls, anonymous
  functions, conditionals, constants, and type annotations.
- Writes generated output to `output.dart` for inspection.

## Behavioral notes and caveats

- Indentation is globally shared through the singleton `Indent` state.
- Some builders intentionally append trailing newlines, while others are
  expression-only and rely on wrapping `Line` nodes.
- `ArrayBuilder` and `ListBuilder` currently generate the same Dart list syntax.
- Generated output is stable and deterministic based on builder ordering.
