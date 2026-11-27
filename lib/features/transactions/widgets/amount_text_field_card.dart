import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_mate/core/theme/app_colors.dart';

class AmountTextFieldCard extends StatelessWidget {
  const new({
    super.key,
    required this.isExpense,
    required this._amountController,
  });

  final bool isExpense;
  final TextEditingController _amountController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  'AMOUNT',
                  style: TextStyle(fontSize: 12, fontWeight: .bold),
                ),
                Container(
                  padding: .symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: isExpense
                        ? Colors.red.shade100
                        : Colors.green.shade100,
                    borderRadius: .circular(20),
                  ),
                  child: Text(
                    isExpense ? 'Cash Outflow' : 'Cash Inflow',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: .bold,
                      color: isExpense
                          ? Colors.red.shade900
                          : Colors.green.shade900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _amountController,
              autofocus: true,
              textAlign: .center,
              maxLength: 13,
              maxLines: 1,
              keyboardType: .numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              textInputAction: .done,
              style: TextStyle(fontSize: 30, fontWeight: .bold),

              decoration: InputDecoration(
                floatingLabelBehavior: .always,
                prefixText: 'MMK',
                prefixStyle: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 20,
                ),
                hintText: "10000",
                hintStyle: TextStyle(fontSize: 30, color: AppColors.textMuted),

                border: OutlineInputBorder(
                  borderSide: .none,
                  borderRadius: .circular(18),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: .none,
                  borderRadius: .circular(18),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: .none,
                  borderRadius: .circular(18),
                ),
                errorBorder: OutlineInputBorder(borderSide: .none),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter an amount";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
