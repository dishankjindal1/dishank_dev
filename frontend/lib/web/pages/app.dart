import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../router/router.dart';

class WebApp extends ConsumerWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Dishank Jindal',
      routerConfig: MyRouter.of().router,
    );
  }
}
