import 'package:flutter/material.dart';

import '../ui/screens/base_screen.dart';

class DeepLinksTestPageParam {
  final String deepLink;
  final Map<String, String> arguments;
  DeepLinksTestPageParam({required this.deepLink, required this.arguments});
}

class DeepLinksTestPage extends BaseScreen<DeepLinksTestPageParam> {
  static const String routeName = "/DeepLinksTestPage";
  const DeepLinksTestPage({required DeepLinksTestPageParam param, super.key})
    : super(param: param);

  @override
  State<DeepLinksTestPage> createState() => _DeepLinksTestPageState();
}

class _DeepLinksTestPageState extends State<DeepLinksTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deep Links Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Deep Link',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 8),
            SelectableText(widget.param.deepLink),
            const SizedBox(height: 24),
            const Text(
              'Arguments',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Expanded(
              child:
                  widget.param.arguments.isEmpty
                      ? const Center(
                        child: Text(
                          'No arguments received',
                          textAlign: TextAlign.center,
                        ),
                      )
                      : ListView.separated(
                        itemBuilder: (context, index) {
                          final entry = widget.param.arguments.entries
                              .elementAt(index);
                          return ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: Text("${entry.key}: ${entry.value}"),
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemCount: widget.param.arguments.length,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
