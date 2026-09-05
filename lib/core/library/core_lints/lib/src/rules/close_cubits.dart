import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart' as linter;

class CloseCubits extends linter.DartLintRule {
  CloseCubits() : super(code: _code);

  static const linter.LintCode _code = linter.LintCode(
    name: "close_cubits",
    problemMessage: "Unclosed instance of 'Cubit'.",
    correctionMessage:
        "Try invoking 'close' in the function in which the 'Cubit' was created",
    errorSeverity: ErrorSeverity.WARNING,
  );

  bool _isCubit(DartType type) => implementInterface("Cubit", type);

  bool implementInterface(String interface, DartType type) {
    if (type is! InterfaceType) return false;

    bool predicate(InterfaceType i) => isSameAs(interface, i);

    var element = type.element;
    return predicate(type) ||
        !element.isSynthetic && element.allSupertypes.any(predicate);
  }

  bool isSameAs(String? interface, DartType type) {
    return type is InterfaceType && type.element.name == interface;
  }

  CompilationUnit? getCompilationUnit(AstNode node) =>
      node.thisOrAncestorOfType<CompilationUnit>();

  bool _cubitCallClose(AstNode node, VariableElement element) {
    return node is MethodInvocation &&
        node.realTarget.toString() == element.name &&
        node.methodName.name == "close";
  }

  void _buildVariableReporter(
    AstNode container,
    VariableDeclaration variable,
    ErrorReporter reporter,
  ) {
    final variableElement = variable.declaredElement;

    if (variableElement == null) return;

    if (variable.initializer == null) return;

    if (!_isCubit(variableElement.type)) return;

    var nodes = container.traverseNodesInDFS();

    bool cubitCallClose = false;
    for (var node in nodes) {
      if (_cubitCallClose(node, variableElement)) {
        cubitCallClose = true;
        return;
      }
    }

    if (!cubitCallClose) {
      reporter.reportError(
        AnalysisError.forValues(
          source: variableElement.source!,
          offset: variableElement.nameOffset,
          length: variableElement.nameLength,
          errorCode: code,
          message: "Unclosed instance of 'Cubit'.",
        ),
      );
    }
  }

  void visitFieldDeclaration(FieldDeclaration node, ErrorReporter reporter) {
    var unit = getCompilationUnit(node);
    if (unit != null) {
      node.fields.variables.forEach((element) {
        _buildVariableReporter(unit, element, reporter);
      });
    }
  }

  void visitVariableDeclaration(
    VariableDeclarationStatement node,
    ErrorReporter reporter,
  ) {
    var unit = getCompilationUnit(node);
    if (unit != null) {
      node.variables.variables.forEach((element) {
        _buildVariableReporter(unit, element, reporter);
      });
    }
  }

  @override
  void run(
    linter.CustomLintResolver resolver,
    ErrorReporter reporter,
    linter.CustomLintContext context,
  ) async {
    context.registry.addFieldDeclaration((node) {
      visitFieldDeclaration(node, reporter);
    });

    context.registry.addVariableDeclarationStatement((node) {
      visitVariableDeclaration(node, reporter);
    });
  }
}

extension AstNodeExtension on AstNode {
  Iterable<AstNode> get childNodes => childEntities.whereType<AstNode>();

  Iterable<AstNode> traverseNodesInDFS() {
    var nodes = <AstNode>{};
    var nodesToVisit = List.of(childNodes);
    while (nodesToVisit.isNotEmpty) {
      var node = nodesToVisit.removeAt(0);
      nodes.add(node);
      nodesToVisit.insertAll(0, node.childNodes);
    }

    return nodes;
  }
}
