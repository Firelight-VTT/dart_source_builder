
import 'package:dart_source_builder/src/anon_function_definition.dart';
import 'package:dart_source_builder/src/anon_positional_parameter_definition.dart';
import 'package:dart_source_builder/src/assignment.dart';
import 'package:dart_source_builder/src/const.dart';
import 'package:dart_source_builder/src/exit.dart';
import 'package:dart_source_builder/src/file.dart';
import 'package:dart_source_builder/src/function_call.dart';
import 'package:dart_source_builder/src/function_definition.dart';
import 'package:dart_source_builder/src/function_named_argument.dart';
import 'package:dart_source_builder/src/generic_parameters_definition.dart';
import 'package:dart_source_builder/src/if.dart';
import 'package:dart_source_builder/src/import.dart';
import 'package:dart_source_builder/src/line.dart';
import 'package:dart_source_builder/src/literal.dart';
import 'package:dart_source_builder/src/string_builder.dart';
import 'package:dart_source_builder/src/type_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:io' as io;

void main() {
  test('adds one to input values', () {
    var file = File(lines: [
      Import(importPath: "dart:io"),
      Import(importPath: 'package:flutter/material.dart'),
      Import(importPath: 'package:flutter/services.dart'),
      Import(importPath: 'package:logging/logging.dart'),
      Import(importPath: 'package:menubar/menubar.dart', prefix: "menubar"),
      Import(importPath: 'package:provider/provider.dart'),
      Import(importPath: 'package:window_size/window_size.dart'),
      Import(importPath: 'src/model/photo_search_model.dart'),
      Import(importPath: 'src/unsplash/unsplash.dart'),
      Import(importPath: 'src/widgets/photo_search_dialog.dart'),
      Import(importPath: 'src/widgets/policy_dialog.dart'),
      Import(importPath: 'src/widgets/unsplash_notice.dart'),
      Import(importPath: 'src/widgets/unsplash_search_content.dart'),
      Import(importPath: 'unsplash_access_key.dart'),

      FunctionDefinition(
        name: "main",
        lines: [
          Line(Assignment(targetName: "Logger.root.level", rhs: Literal("Level.all"))),
          Line(
            FunctionCall(
              functionName: "Logger.root.onRecord.listen",
              positionalArguments: [
                AnonFunctionDefinition(
                  parameters: [
                    AnonPositionalParameterDefinition(name: "rec")
                  ],
                  lines: [
                    Line(
                      FunctionCall(
                        functionName: "print", 
                        positionalArguments: [
                          Literal("'\${rec.level.name}] \${rec.time}: \${rec.message}'")
                        ]
                      )
                    )
                  ]
                )
              ]
            )
          ),
          If(
            condition: Literal("unsplashAccessKey.isEmpty"),
            lines: [
              Line(
                FunctionCall(
                targetObject: FunctionCall(
                  functionName: "Logger",
                  positionalArguments: [
                    StringBuilder("main", useSingleQuotes: true)
                  ]
                ),
                functionName:"severe",
                positionalArguments: [
                  StringBuilder("Unsplash Access Key is required. ", useSingleQuotes: true),
                  StringBuilder("Please add to `lib/unsplash_access_key.dart`.", useSingleQuotes: true)
                ] )
              ),
              Exit(1),
            ]
          ),
          Line(FunctionCall(functionName: "setupWindow")),
          Line(
            FunctionCall(
              functionName: "setupWindow",
              positionalArguments: [
                FunctionCall(
                  functionName: "ChangeNotifierProvider",
                  genericParametersDefinition: GenericParametersDefinition([TypeBuilder.custom("PhotoSearchModel")]),
                  namedArguments: [
                    FunctionNamedArgument(
                      name: "create",
                      value: AnonFunctionDefinition(
                        parameters: [
                          AnonPositionalParameterDefinition(name: "context")
                        ],
                        lines: [
                          Line(
                            FunctionCall(
                              functionName: "PhotoSearchModel",
                              positionalArguments: [
                                FunctionCall(
                                  functionName: "Unsplash",
                                  namedArguments: [
                                    FunctionNamedArgument(name: "accessKey", value: Literal("unsplashAccessKey"))
                                  ]
                                )
                              ] 
                            )
                          )
                        ]
                      )

                    )
                  ]
                ),
                Const(
                  FunctionCall(
                    functionName: "UnsplashSearchApp"
                  )
                )
            
              ]
            )
          )

        ],
      )

    ]);

    var output = file.build();
    io.File("output.dart").writeAsStringSync(output);
  });
}
