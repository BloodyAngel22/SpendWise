import 'package:app/features/category/application/usecases/category_usecases.dart';
import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/spend/domain/entities/spend_filter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class FilterSpendDrawer extends StatefulWidget {
  final SpendFilter filter;
  final void Function(SpendFilter) onApplyFilter;

  const FilterSpendDrawer({
    super.key,
    required this.filter,
    required this.onApplyFilter,
  });

  @override
  State<FilterSpendDrawer> createState() => _FilterSpendDrawerState();
}

class _FilterSpendDrawerState extends State<FilterSpendDrawer> {
  late List<Category> categories = [];
  late Category? selectedCategory;
  late DateTimeRange? selectedDateRange;
  late RangeValues selectedAmountRange;

  final double minAmount = 0;
  final double maxAmount = 1_000_000;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.filter.category;
    selectedDateRange = widget.filter.spendRange;
    selectedAmountRange =
        widget.filter.amountRange ?? RangeValues(minAmount, maxAmount);

    _loadCategories();
  }

  void _loadCategories() async {
    final loaded = await GetIt.I<CategoryUsecases>().getCategories();
    setState(() => categories = loaded);
  }

  void _clear() {
    setState(() {
      selectedCategory = null;
      selectedDateRange = null;
      selectedAmountRange = RangeValues(minAmount, maxAmount);
    });
  }

  void _apply() {
    widget.onApplyFilter(
      SpendFilter(
        category: selectedCategory,
        spendRange: selectedDateRange,
        amountRange: selectedAmountRange,
      ),
    );
    Navigator.of(context).maybePop();
  }

  void _pickDateRange() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 5);
    final lastDate = DateTime(now.year + 1);

    final pickedStart = await showDatePicker(
      context: context,
      initialDate: selectedDateRange?.start ?? now,
      firstDate: firstDate,
      lastDate: lastDate,
      helpText: 'Начальная дата',
    );

    if (pickedStart == null) return;

    final pickedEnd = await showDatePicker(
      context: context,
      initialDate: selectedDateRange?.end ?? pickedStart,
      firstDate: pickedStart,
      lastDate: lastDate,
      helpText: 'Конечная дата',
    );

    if (pickedEnd == null) return;

    setState(() {
      selectedDateRange = DateTimeRange(start: pickedStart, end: pickedEnd);
    });
  }

  String _formatDateRange(DateTimeRange? range) {
    if (range == null) return 'Не выбрано';
    final format = DateFormat('dd.MM.yyyy');
    return '${format.format(range.start)} — ${format.format(range.end)}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Drawer(
      width: isDesktop ? 800 : double.infinity,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Text('Фильтры', style: theme.textTheme.titleSmall),
              const SizedBox(height: 16),

              // Категория
              DropdownButtonFormField<Category>(
                initialValue: selectedCategory,
                items: categories
                    .map(
                      (c) => DropdownMenuItem(value: c, child: Text(c.title)),
                    )
                    .toList(),
                onChanged: (c) => setState(() => selectedCategory = c),
                decoration: const InputDecoration(
                  labelText: 'Категория',
                  border: OutlineInputBorder(),
                ),
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),

              // Дата
              GestureDetector(
                onTap: () => _pickDateRange(),
                child: AbsorbPointer(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Диапазон дат',
                      border: const OutlineInputBorder(),
                      suffixIcon: const Icon(Icons.calendar_today),
                    ),
                    controller: TextEditingController(
                      text: _formatDateRange(selectedDateRange),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Сумма
              Text('Сумма трат (₽)', style: theme.textTheme.bodyMedium),
              RangeSlider(
                values: selectedAmountRange,
                min: minAmount,
                max: maxAmount,
                divisions: 100,
                labels: RangeLabels(
                  '${selectedAmountRange.start.toInt()} ₽',
                  '${selectedAmountRange.end.toInt()} ₽',
                ),
                onChanged: (r) => setState(() => selectedAmountRange = r),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${selectedAmountRange.start.toInt()} ₽'),
                  Text('${selectedAmountRange.end.toInt()} ₽'),
                ],
              ),

              const SizedBox(height: 16),

              Expanded(
                child: OutlinedButton(
                  onPressed: _clear,
                  child: const Text('Сбросить'),
                ),
              ),

              const SizedBox(height: 16),

              // Кнопки
              Row(
                spacing: isDesktop ? 18 : 12,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: Navigator.of(context).maybePop,
                      child: const Text('Отменить'),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _apply,
                      child: const Text('Применить'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
