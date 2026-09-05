import 'package:core_lints/src/rules/close_cubits.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

PluginBase createPlugin() => _CoreLints();

class _CoreLints extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        CloseCubits(),
      ];
}
