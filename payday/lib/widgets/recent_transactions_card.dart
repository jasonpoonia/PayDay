import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/budget_provider.dart';
import '../models/budget_model.dart';
import '../utils/app_colors.dart';

class RecentTransactionsCard extends StatelessWidget {
  const RecentTransactionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BudgetProvider>(
      builder: (context, budgetProvider, child) {
        final transactions = budgetProvider.recentTransactions.take(5).toList();
        
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Future: Navigate to full transaction history
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...transactions.map((transaction) => _buildTransactionItem(transaction)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTransactionItem(Transaction transaction) {
    final formatter = NumberFormat.currency(locale: 'en_NZ', symbol: '\$');
    final dateFormatter = DateFormat('MMM dd');
    
    Color amountColor;
    IconData icon;
    Color iconColor;
    
    switch (transaction.type) {
      case TransactionType.income:
        amountColor = AppColors.success;
        icon = Icons.arrow_downward;
        iconColor = AppColors.success;
        break;
      case TransactionType.expense:
        amountColor = AppColors.error;
        icon = Icons.arrow_upward;
        iconColor = AppColors.error;
        break;
      case TransactionType.transfer:
        amountColor = AppColors.info;
        icon = Icons.swap_horiz;
        iconColor = AppColors.info;
        break;
    }
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '${transaction.category} • ${dateFormatter.format(transaction.date)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            formatter.format(transaction.amount.abs()),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}