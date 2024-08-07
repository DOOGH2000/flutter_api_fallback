import 'package:flutter/material.dart';
import 'package:flutter_api_fallback/core/network/remote/apis/dio_helper.dart';
import 'package:flutter_api_fallback/features/services/presentation/view/screens/home_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/services/presentation/controller/ser_product_cubit.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => SerProductCubit(),
        child: const HomeService(),
      ),
    );
  }
}
