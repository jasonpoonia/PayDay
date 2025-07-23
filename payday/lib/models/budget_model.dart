class BudgetRule {
  final String id;
  final String name;
  final double percentage;
  final double fixedAmount;
  final String accountType;
  final bool isPercentage;
  final String icon;
  final int colorIndex;

  const BudgetRule({
    required this.id,
    required this.name,
    required this.percentage,
    required this.fixedAmount,
    required this.accountType,
    required this.isPercentage,
    required this.icon,
    required this.colorIndex,
  });

  double getAmount(double totalIncome) {
    return isPercentage ? (totalIncome * percentage / 100) : fixedAmount;
  }
}

class Transaction {
  final String id;
  final String description;
  final double amount;
  final DateTime date;
  final String category;
  final TransactionType type;

  const Transaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.category,
    required this.type,
  });
}

enum TransactionType {
  income,
  expense,
  transfer,
}

class GoalProgress {
  final String name;
  final double current;
  final double target;
  final DateTime targetDate;
  final String icon;

  const GoalProgress({
    required this.name,
    required this.current,
    required this.target,
    required this.targetDate,
    required this.icon,
  });

  double get progressPercentage => (current / target * 100).clamp(0, 100);
  bool get isCompleted => current >= target;
}