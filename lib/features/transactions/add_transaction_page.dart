import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:money_mate/core/extensions/snackbar_extension.dart';
import 'package:money_mate/core/theme/app_colors.dart';
import 'package:money_mate/features/category/cubit/category_cubit.dart';
import 'package:money_mate/features/category/cubit/category_state.dart';
import 'package:money_mate/features/transactions/cubit/add_transaction_cubit.dart';
import 'package:money_mate/features/transactions/cubit/add_transaction_state.dart';
import 'package:money_mate/features/transactions/widgets/amount_text_field_card.dart';
import 'package:money_mate/features/transactions/widgets/category_card.dart';
import 'package:money_mate/features/transactions/widgets/transaction_type_item.dart';
import 'package:money_mate/main.dart';
import 'package:money_mate/models/category_model.dart';
import 'package:money_mate/widgets/primary_button.dart';
import 'package:money_mate/widgets/primary_text_field.dart';

class AddTransactionPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AddTransactionCubit>()),
        BlocProvider(create: (_) => sl<CategoryCubit>()),
      ],
      child: _AddTransactionView(),
    );
  }
}

class _AddTransactionView extends StatefulWidget {
  const new();

  @override
  State<_AddTransactionView> createState() => __AddTransactionViewState();
}

class __AddTransactionViewState extends State<_AddTransactionView> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  final _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat("MMM d, yyyy").format(DateTime.now());
  }

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    _dateController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(DateTime currentDate) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2020),
      lastDate: now,
      helpText: "Select Date",
    );
    if (picked != null && mounted) {
      final updateDateTime = DateTime(
        picked.year,
        picked.month,
        picked.day,
        now.hour,
        now.minute,
        now.second,
      );

      context.read<AddTransactionCubit>().changeDateTime(updateDateTime);
      _dateController.text = DateFormat("MMM d, yyyy").format(updateDateTime);
    }
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;
    final rawAount = _amountController.text.replaceAll(",", "").trim();
    final amount = double.tryParse(rawAount) ?? 0.0;

    context.read<AddTransactionCubit>().submitTransaction(
      amount: amount,
      title: _titleController.text,
      note: _noteController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<AddTransactionCubit, AddTransactionState>(
      listener: (context, state) {
        if (state.status == AddTransactionStatus.failure &&
            state.errorMessage != null) {
          context.showSnackBar(
            state.errorMessage,
            backgroundColor: AppColors.expense,
          );
        } else if (state.status == AddTransactionStatus.success) {
          context.showSnackBar("Transaction Saved");
          context.pop();
        }
      },
      builder: (context, txState) {
        final isExpense = txState.type == TransactionType.expense;
        final isSubmitting = txState.status == AddTransactionStatus.submitting;

        return Scaffold(
          appBar: AppBar(title: Text('Add Transaction')),
          body: SingleChildScrollView(
            padding: .symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Expense , Income Selector
                  Container(
                    padding: .all(6),
                    decoration: BoxDecoration(
                      borderRadius: .circular(50),
                      color: AppColors.blueBg,
                    ),
                    child: Column(
                      children: [
                        Row(
                          spacing: 10,
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Expanded(
                              child: TransactionTypeItem(
                                title: 'Expense',
                                icon: Icons.arrow_circle_down,
                                backgroundColor: isExpense
                                    ? AppColors.expense
                                    : AppColors.blueBg,
                                foregroundColor: isExpense
                                    ? theme.colorScheme.onPrimary
                                    : theme.colorScheme.onPrimaryContainer,
                                onTap: () {
                                  context
                                      .read<AddTransactionCubit>()
                                      .changeType(TransactionType.expense);
                                },
                              ),
                            ),
                            Expanded(
                              child: TransactionTypeItem(
                                title: 'Income',
                                icon: Icons.arrow_circle_up,
                                backgroundColor: !isExpense
                                    ? AppColors.primary
                                    : Colors.blue.shade200.withValues(
                                        alpha: 0.2,
                                      ),
                                foregroundColor: !isExpense
                                    ? theme.colorScheme.onPrimary
                                    : theme.colorScheme.onPrimaryContainer,
                                onTap: () {
                                  context
                                      .read<AddTransactionCubit>()
                                      .changeType(TransactionType.income);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Amount
                  AmountTextFieldCard(
                    isExpense: isExpense,
                    amountController: _amountController,
                  ),
                  const SizedBox(height: 20),

                  // Select Category
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "Select Category",
                        style: TextStyle(
                          fontWeight: .bold,
                          color: theme.colorScheme.onSurface,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Add New",
                          style: TextStyle(fontWeight: .bold, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Horizontal Category List (Default + Custom from CategoryCubit)
                  BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, catState) {
                      if (catState is CategoryLoading) {
                        return const SizedBox(
                          height: 110,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final List<CategoryModel> categories =
                          catState is CategoryLoaded
                          ? (isExpense
                                ? catState.expenseCategories
                                : catState.incomeCategories)
                          : [];

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              mainAxisExtent: 110,
                            ),
                        itemCount: categories.length,

                        itemBuilder: ((context, index) {
                          final category = categories[index];

                          final isSelected =
                              category.id == txState.selectedCategory.id;

                          return CategoryCard(
                            category: category,
                            isSelected: isSelected,
                            theme: theme,
                          );
                        }),
                      );
                    },
                  ),

                  const SizedBox(height: 20),
                  // Details Info Textfields:
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        spacing: 20,
                        children: [
                          PrimaryTextField(
                            controller: _titleController,
                            label: "Title",
                            hint: "City Mart Groceries",
                            prefixIcon: Icons.shopping_bag_outlined,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter transaction title";
                              }
                              return null;
                            },
                          ),
                          PrimaryTextField(
                            onTap: () => _selectDate(txState.dateTime),
                            controller: _dateController,
                            label: "Date",
                            hint: "",
                            readOnly: true,
                            prefixIcon: Icons.calendar_month,
                          ),

                          PrimaryTextField(
                            controller: _noteController,
                            label: "Note  (Optional)",
                            maxLines: 3,
                            hint: "Weekly vegetable and pantry restocking",
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      label: isSubmitting ? "Saving..." : 'Save Transaction',
                      onPressed: isSubmitting ? null : _onSave,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
