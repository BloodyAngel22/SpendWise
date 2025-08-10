import 'package:app/common/utils/validators/spend_validator.dart';
import 'package:app/features/category/application/usecases/category_usecases.dart';
import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/spend/application/bloc/spend_bloc.dart';
import 'package:app/features/spend/domain/entities/spend.dart';
import 'package:app/features/spend/infrastructure/datamodels/spend_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:app/generated/l10n.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class UpdateSpendScreen extends StatefulWidget {
  final SpendBloc spendBloc;
  final Spend spend;

  const UpdateSpendScreen({
    super.key,
    required this.spendBloc,
    required this.spend,
  });

  @override
  State<UpdateSpendScreen> createState() => _UpdateSpendScreenState();
}

class _UpdateSpendScreenState extends State<UpdateSpendScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _spendAtController = TextEditingController();
  final _categoryIdController = TextEditingController();
  bool isLoading = true;

  List<Category> categories = [];
  Category? selectedCategory;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final loadedCategories = await GetIt.I<CategoryUsecases>().getCategories();

    setState(() {
      categories = loadedCategories;
      selectedCategory = categories.firstWhere(
        (category) => category.title == widget.spend.categoryName,
      );

      _titleController.text = widget.spend.title;
      _amountController.text = widget.spend.amount.toString();
      _spendAtController.text = DateFormat('dd.MM.yyyy').format(widget.spend.spendAt);
      _categoryIdController.text = selectedCategory!.id.toString();

      isLoading = false;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _spendAtController.dispose();
    _categoryIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.I;
    final theme = Theme.of(context);

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).updateSpendTitle, style: theme.textTheme.titleMedium),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: S.of(context).spendTitleLabel,
                  hintText: S.of(context).spendTitleHint,
                  border: OutlineInputBorder(),
                ),
                validator: (value) => SpendValidator.validateTitle(value),
              ),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: S.of(context).spendAmountLabel,
                  hintText: S.of(context).spendAmountHint,
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) => SpendValidator.validateAmount(value),
              ),
              InkWell(
                onTap: () => _selectDate(context),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Дата',
                    border: OutlineInputBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _spendAtController.text.isEmpty
                            ? S.of(context).selectDate
                            : _spendAtController.text,
                      ),
                      const Icon(Icons.calendar_month),
                    ],
                  ),
                ),
              ),
              DropdownButtonFormField<Category>(
                decoration: InputDecoration(
                  labelText: S.of(context).category,
                  border: OutlineInputBorder(),
                ),
                initialValue: selectedCategory,
                items: categories.map((category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.title),
                  );
                }).toList(),
                onChanged: (category) {
                  setState(() {
                    selectedCategory = category;
                    _categoryIdController.text = category!.id.toString();
                  });
                },
                validator: (value) => SpendValidator.validateCategory(value),
              ),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(S.of(context).cancel),
                  ),
                  ElevatedButton(
                    onPressed: () => _submitForm(context, getIt),
                    child: Text(S.of(context).update),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context, GetIt getIt) {
    if (_formKey.currentState!.validate()) {
      final date = DateFormat('dd.MM.yyyy').parse(_spendAtController.text);

      getIt<Talker>().info(
        'Обновлен расход: ${_titleController.text} ${_amountController.text} $date ${_categoryIdController.text}',
      );

      final spendModel = SpendModel(
        id: widget.spend.id,
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        spendAt: date,
        categoryId: int.parse(_categoryIdController.text),
      );

      widget.spendBloc.add(UpdateSpendEvent(spendModel));
      Navigator.pop(context);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final picker = await showDatePicker(
      context: context,
      initialDate: _spendAtController.text.isEmpty
          ? DateTime.now()
          : DateFormat('dd.MM.yyyy').parse(_spendAtController.text),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picker != null) {
      setState(() {
        _spendAtController.text = DateFormat('dd.MM.yyyy').format(picker);
      });
    }
  }
}
