import 'package:flutter/foundation.dart';
import '../models/budget_model.dart';

class BudgetProvider extends ChangeNotifier {
  // Mock data for MVP
  double _monthlyIncome = 5200.0; // NZ$5,200 monthly salary
  double _currentBalance = 1850.0;
  
  final List<BudgetRule> _budgetRules = [
    const BudgetRule(
      id: '1',
      name: 'Emergency Fund',
      percentage: 15.0,
      fixedAmount: 0,
      accountType: 'Savings',
      isPercentage: true,
      icon: '🛡️',
      colorIndex: 0,
    ),
    const BudgetRule(
      id: '2',
      name: 'Bills & Rent',
      percentage: 45.0,
      fixedAmount: 0,
      accountType: 'Checking',
      isPercentage: true,
      icon: '🏠',
      colorIndex: 1,
    ),
    const BudgetRule(
      id: '3',
      name: 'Long-term Savings',
      percentage: 20.0,
      fixedAmount: 0,
      accountType: 'Investment',
      isPercentage: true,
      icon: '💰',
      colorIndex: 2,
    ),
    const BudgetRule(
      id: '4',
      name: 'Spending Money',
      percentage: 20.0,
      fixedAmount: 0,
      accountType: 'Checking',
      isPercentage: true,
      icon: '🛍️',
      colorIndex: 3,
    ),
  ];

  final List<Transaction> _recentTransactions = [
    Transaction(
      id: '1',
      description: 'Salary Deposit',
      amount: 5200.0,
      date: DateTime.now().subtract(const Duration(days: 2)),
      category: 'Income',
      type: TransactionType.income,
    ),
    Transaction(
      id: '2',
      description: 'Emergency Fund Transfer',
      amount: -780.0,
      date: DateTime.now().subtract(const Duration(days: 2)),
      category: 'Savings',
      type: TransactionType.transfer,
    ),
    Transaction(
      id: '3',
      description: 'Rent Payment',
      amount: -1800.0,
      date: DateTime.now().subtract(const Duration(days: 1)),
      category: 'Bills',
      type: TransactionType.expense,
    ),
    Transaction(
      id: '4',
      description: 'Grocery Shopping',
      amount: -145.50,
      date: DateTime.now(),
      category: 'Food',
      type: TransactionType.expense,
    ),
  ];

  final List<GoalProgress> _financialGoals = [
    GoalProgress(
      name: 'Emergency Fund',
      current: 4200.0,
      target: 15000.0,
      targetDate: DateTime(2025, 12, 31),
      icon: '🛡️',
    ),
    GoalProgress(
      name: 'House Deposit',
      current: 12500.0,
      target: 80000.0,
      targetDate: DateTime(2027, 6, 30),
      icon: '🏠',
    ),
    GoalProgress(
      name: 'Holiday Fund',
      current: 850.0,
      target: 3000.0,
      targetDate: DateTime(2025, 11, 15),
      icon: '✈️',
    ),
  ];

  // Getters
  double get monthlyIncome => _monthlyIncome;
  double get currentBalance => _currentBalance;
  List<BudgetRule> get budgetRules => _budgetRules;
  List<Transaction> get recentTransactions => _recentTransactions;
  List<GoalProgress> get financialGoals => _financialGoals;

  // Calculate allocations based on current income
  Map<String, double> get budgetAllocations {
    Map<String, double> allocations = {};
    for (var rule in _budgetRules) {
      allocations[rule.name] = rule.getAmount(_monthlyIncome);
    }
    return allocations;
  }

  // Get total allocated amount
  double get totalAllocated {
    return budgetAllocations.values.fold(0.0, (sum, amount) => sum + amount);
  }

  // Get remaining unallocated amount
  double get unallocatedAmount {
    return _monthlyIncome - totalAllocated;
  }

  // Mock method to simulate next payday automation
  DateTime get nextPayday {
    final now = DateTime.now();
    final daysUntilFriday = (5 - now.weekday) % 7;
    final nextFriday = now.add(Duration(days: daysUntilFriday == 0 ? 7 : daysUntilFriday));
    return DateTime(nextFriday.year, nextFriday.month, nextFriday.day, 9, 0);
  }

  // Update income (for future functionality)
  void updateMonthlyIncome(double newIncome) {
    _monthlyIncome = newIncome;
    notifyListeners();
  }

  // Add new budget rule (for future functionality)
  void addBudgetRule(BudgetRule rule) {
    _budgetRules.add(rule);
    notifyListeners();
  }

  // Remove budget rule (for future functionality)
  void removeBudgetRule(String ruleId) {
    _budgetRules.removeWhere((rule) => rule.id == ruleId);
    notifyListeners();
  }
}