import 'package:bloc_api_call_demo/router/path_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      context.goNamed(PathNames.usersList);
    });
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FlutterLogo(
          size: 200,
        ),
      ),
    );
  }
}
