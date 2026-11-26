import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_mate/core/router/app_router.dart';
import 'package:money_mate/core/theme/app_theme.dart';
import 'package:money_mate/features/auth/cubit/login_cubit.dart';
import 'package:money_mate/features/auth/cubit/signup_cubit.dart';
import 'package:money_mate/features/category/cubit/category_cubit.dart';
import 'package:money_mate/features/transactions/cubit/add_transaction_cubit.dart';
import 'package:money_mate/firebase_options.dart';
import 'package:money_mate/services/auth_service.dart';
import 'package:money_mate/services/category_service.dart';
import 'package:money_mate/services/transaction_service.dart';
import 'package:money_mate/services/user_service.dart';

final sl = GetIt.instance;
void setupLocator() {
  // Firebase
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Services
  sl.registerLazySingleton(
    () => UserService(firestore: sl<FirebaseFirestore>()),
  );
  sl.registerLazySingleton(() => AuthService(firebaseAuth: sl<FirebaseAuth>()));
  sl.registerLazySingleton<CategoryService>(
    () => CategoryService(
      auth: sl<FirebaseAuth>(),
      firestore: sl<FirebaseFirestore>(),
    ),
  );
  sl.registerLazySingleton<TransactionService>(
    () => TransactionService(
      firestore: sl<FirebaseFirestore>(),
      auth: sl<FirebaseAuth>(),
    ),
  );
  // Cubit
  sl.registerFactory<SignUpCubit>(
    () => SignUpCubit(
      authService: sl<AuthService>(),
      userService: sl<UserService>(),
    ),
  );
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(authService: sl<AuthService>()),
  );
  sl.registerFactory<CategoryCubit>(
    () => CategoryCubit(categoryService: sl<CategoryService>()),
  );
  sl.registerFactory<AddTransactionCubit>(
    () => AddTransactionCubit(transactionService: sl<TransactionService>()),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'Money Mate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
