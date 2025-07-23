import 'package:flutter/foundation.dart';
import '../models/budget_model.dart';

class BudgetProvider extends ChangeNotifier {
  // Income allocation focused data
  double _nextPayAmount = 5200.0; // Next expected income
  DateTime _nextPayDate = DateTime.now().add(const Duration(days: 3));

  final List<AllocationRule> _allocationRules = [
    const AllocationRule(
      id: '1',
      name: 'Emergency Fund',
      percentage: 15.0,
      currentAmount: 4200.0,
      targetAmount: 15000.0,
      accountType: 'Savings',
      icon: '🛡️',
      colorIndex: 0,
      isActive: true,
    ),
    const AllocationRule(
      id: '2',
      name: 'Investment Account',
      percentage: 25.0,
      currentAmount: 12500.0,
      targetAmount: 50000.0,
      accountType: 'Investment',
      icon: '📈',
      colorIndex: 1,
      isActive: true,
    ),
    const AllocationRule(
      id: '3',
      name: 'House Deposit',
      percentage: 30.0,
      currentAmount: 35000.0,
      targetAmount: 80000.0,
      accountType: 'Savings',
      icon: '🏠',
      colorIndex: 2,
      isActive: true,
    ),
    const AllocationRule(
      id: '4',
      name: 'Holiday Fund',
      percentage: 10.0,
      currentAmount: 1850.0,
      targetAmount: 5000.0,
      accountType: 'Savings',
      icon: '✈️',
      colorIndex: 3,
      isActive: true,
    ),
    const AllocationRule(
      id: '5',
      name: 'Everyday Spending',
      percentage: 10.0,
      currentAmount: 1200.0,
      targetAmount: null,
      accountType: 'Checking',
      icon: '💳',
      colorIndex: 4,
      isActive: true,
    ),
  ];

  final List<AutoTransfer> _recentAutoTransfers = [
    AutoTransfer(
      id: '1',
      destinationName: 'Emergency Fund',
      amount: 780.0,
      transferDate: DateTime.now().subtract(const Duration(days: 2)),
      status: AutoTransferStatus.completed,
      icon: '🛡️',
    ),
    AutoTransfer(
      id: '2',
      destinationName: 'Investment Account',
      amount: 1300.0,
      transferDate: DateTime.now().subtract(const Duration(days: 2)),
      status: AutoTransferStatus.completed,
      icon: '📈',
    ),
    AutoTransfer(
      id: '3',
      destinationName: 'House Deposit',
      amount: 1560.0,
      transferDate: DateTime.now().subtract(const Duration(days: 2)),
      status: AutoTransferStatus.completed,
      icon: '🏠',
    ),
    AutoTransfer(
      id: '4',
      destinationName: 'Holiday Fund',
      amount: 520.0,
      transferDate: DateTime.now().subtract(const Duration(days: 2)),
      status: AutoTransferStatus.completed,
      icon: '✈️',
    ),
  ];

  // Getters
  double get nextPayAmount => _nextPayAmount;
  DateTime get nextPayDate => _nextPayDate;
  List<AllocationRule> get allocationRules => _allocationRules;
  List<AutoTransfer> get recentAutoTransfers => _recentAutoTransfers;

  // Calculate total allocated percentage
  double get totalAllocatedPercentage {
    return _allocationRules
        .where((rule) => rule.isActive)
        .map((rule) => rule.percentage)
        .fold(0.0, (sum, percentage) => sum + percentage);
  }

  // Calculate total allocated amount for next pay
  double get totalAllocatedAmount {
    return (_nextPayAmount * totalAllocatedPercentage / 100);
  }

  // Calculate unallocated amount
  double get unallocatedAmount {
    return _nextPayAmount - totalAllocatedAmount;
  }

  // Calculate unallocated percentage
  double get unallocatedPercentage {
    return 100 - totalAllocatedPercentage;
  }

  // Get allocation amount for specific rule
  double getAllocationAmount(AllocationRule rule) {
    return _nextPayAmount * rule.percentage / 100;
  }

  // Check if automation is active
  bool get isAutomationActive {
    return _allocationRules.any((rule) => rule.isActive);
  }

  // Get days until next payday
  int get daysUntilNextPay {
    final now = DateTime.now();
    final difference = _nextPayDate.difference(now);
    return difference.inDays;
  }

  // Get next auto-transfer time
  String get nextAutoTransferTime {
    // Assuming transfers happen at 9 AM on payday
    final transferTime = DateTime(
      _nextPayDate.year,
      _nextPayDate.month,
      _nextPayDate.day,
      9,
      0,
    );

    final weekday = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return '${weekday[transferTime.weekday - 1]}, 9:00 AM';
  }

  // Active allocation rules only
  List<AllocationRule> get activeAllocationRules {
    return _allocationRules.where((rule) => rule.isActive).toList();
  }

  // Get top 3 allocations by amount
  List<AllocationRule> get topAllocations {
    final sorted = List<AllocationRule>.from(_allocationRules);
    sorted.sort((a, b) => b.percentage.compareTo(a.percentage));
    return sorted.take(3).toList();
  }

  // Update next pay amount
  void updateNextPayAmount(double newAmount) {
    _nextPayAmount = newAmount;
    notifyListeners();
  }

  // Add new allocation rule
  void addAllocationRule(AllocationRule rule) {
    _allocationRules.add(rule);
    notifyListeners();
  }

  // Update allocation rule
  void updateAllocationRule(String ruleId, AllocationRule updatedRule) {
    final index = _allocationRules.indexWhere((rule) => rule.id == ruleId);
    if (index != -1) {
      _allocationRules[index] = updatedRule;
      notifyListeners();
    }
  }

  // Remove allocation rule
  void removeAllocationRule(String ruleId) {
    _allocationRules.removeWhere((rule) => rule.id == ruleId);
    notifyListeners();
  }

  // Toggle allocation rule active status
  void toggleAllocationRule(String ruleId) {
    final index = _allocationRules.indexWhere((rule) => rule.id == ruleId);
    if (index != -1) {
      final rule = _allocationRules[index];
      _allocationRules[index] = AllocationRule(
        id: rule.id,
        name: rule.name,
        percentage: rule.percentage,
        currentAmount: rule.currentAmount,
        targetAmount: rule.targetAmount,
        accountType: rule.accountType,
        icon: rule.icon,
        colorIndex: rule.colorIndex,
        isActive: !rule.isActive,
      );
      notifyListeners();
    }
  }

  // Simulate auto-transfer execution
  void executeAutoTransfers() {
    for (final rule in activeAllocationRules) {
      final transfer = AutoTransfer(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        destinationName: rule.name,
        amount: getAllocationAmount(rule),
        transferDate: DateTime.now(),
        status: AutoTransferStatus.processing,
        icon: rule.icon,
      );
      _recentAutoTransfers.insert(0, transfer);
    }
    notifyListeners();
  }
}
