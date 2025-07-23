import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/budget_provider.dart';
import 'screens/home_screen.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(const PaydayApp());
}

class PaydayApp extends StatelessWidget {
  const PaydayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BudgetProvider()),
      ],
      child: MaterialApp(
        title: 'Payday',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: AppColors.background,
          fontFamily: 'Inter',
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.background,
            elevation: 0,
            foregroundColor: AppColors.textPrimary,
          ),
          cardTheme: CardTheme(
            color: AppColors.cardBackground,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
