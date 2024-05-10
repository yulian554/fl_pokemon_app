import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:commons/util/constans_route.dart';
import 'package:app_pokenmon/presentation/ui/views/views.dart';

class Error404ViewMain extends StatelessWidget {
  final String message;

  const Error404ViewMain({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return View404(
      message: message,
      goBack: () {
        context.goNamed(Routes.home);
      },
    );
  }
}
