import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/ui/screens/base_screen.dart';
import '../state_m/provider/manual_location_picker_notifier.dart';
import 'manual_location_picker_screen_content.dart';

class ManualLocationPickerScreenParam {
  const ManualLocationPickerScreenParam();
}

class ManualLocationPickerScreen
    extends BaseScreen<ManualLocationPickerScreenParam> {
  static const routeName = '/ManualLocationPickerScreen';

  const ManualLocationPickerScreen({
    Key? key,
    required ManualLocationPickerScreenParam param,
  }) : super(key: key, param: param);

  @override
  State<ManualLocationPickerScreen> createState() =>
      _ManualLocationPickerScreenState();
}

class _ManualLocationPickerScreenState
    extends State<ManualLocationPickerScreen> {
  late final ManualLocationPickerNotifier provider;

  @override
  void initState() {
    super.initState();
    provider = ManualLocationPickerNotifier(widget.param);
  }

  @override
  void dispose() {
    provider.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ManualLocationPickerNotifier>.value(
      value: provider,
      child: const ManualLocationPickerScreenContent(),
    );
  }
}
