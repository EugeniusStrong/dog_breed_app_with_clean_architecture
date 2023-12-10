import 'package:dog_breed_app_with_clean_architecture/presentation/bloc/dog_list_cubit/dog_list_cubit.dart';
import 'package:dog_breed_app_with_clean_architecture/presentation/pages/dog_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/app_colors.dart';
import 'locator_service.dart' as di;
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogListCubit>(
      create: (context) => sl<DogListCubit>()..loadDog(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme: ThemeData.dark().colorScheme.copyWith(
                background: AppColors.mainBackground,
              ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
