import 'package:flutter/material.dart';
import 'package:form_poc/resolver.dart';
import 'package:form_poc/trigger.dart';

class TestPageModel extends StatelessWidget {
  TestPageModel({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final modelsTrigger = mock
        .map(
          (e) => Resolver.getFieldByModel(e['type'] as String).modelFromMap(e),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page model'),
      ),
      body: Trigger(
        models: modelsTrigger,
        child: Builder(
          builder: (context) {
            final models = Trigger.of(context).notifier!.value;

            return Form(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: models.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, index) {
                        final item = models.elementAt(index);

                        final field = Resolver.getFieldByModel(
                          item.runtimeType.toString(),
                        );
                        return field.builder(model: item);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () => formKey.currentState!.validate(),
                        child: const Text('OK'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

const mock = [
  {'type': 'PalmPasswordModel'},
  {'type': 'PalmMoneyModel'},
  {'type': 'PalmTableModel'},
  {'type': 'PalmPasswordModel'},
  {'type': 'PalmMoneyModel'},
  {'type': 'PalmTableModel'},
];
