// import 'package:flutter/material.dart';
// import 'package:form_poc/resolver.dart';
// import 'package:form_poc/trigger.dart';

// class TestPage extends StatelessWidget {
//   TestPage({super.key});

//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Test Page'),
//       ),
//       body: Trigger(
//         models: const [],
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView.separated(
//                   itemCount: mock.length,
//                   separatorBuilder: (_, __) => const SizedBox(height: 12),
//                   itemBuilder: (_, index) {
//                     final item = mock.elementAt(index);

//                     final builder =
//                         Resolver.getBuilderByType(item['type'] as String);
//                     return builder({});
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Center(
//                   child: ElevatedButton(
//                     onPressed: () => formKey.currentState!.validate(),
//                     child: const Text('OK'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// const mock = [
//   {'type': 'PalmPasswordField'},
//   {'type': 'PalmMoneyField'},
//   {'type': 'TableWidget'},
// ];
