import 'package:app/common/utils/validators/category_validator.dart';
import 'package:app/features/category/application/bloc/category_bloc.dart';
import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/category/domain/irepositories/i_category_repository.dart';
import 'package:app/features/category/infrastructure/datamodels/category_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class AddCategoryScreen extends StatefulWidget {
  final CategoryBloc categoryBloc;

  const AddCategoryScreen({super.key, required this.categoryBloc});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    categories = await GetIt.I<ICategoryRepository>().getCategories();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final getIt = GetIt.I;

    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить категорию', style: theme.textTheme.titleMedium),
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
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Название категории',
                  hintText: 'Введите название категории',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => CategoryValidator.validateTitle(value, categories),
              ),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Отмена'),
                  ),
                  ElevatedButton(
                    onPressed: () => _submitForm(context, getIt),
                    child: const Text('Добавить'),
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
      final name = _nameController.text;

      final categoryModel = CategoryModel(id: null, title: name);

      widget.categoryBloc.add(AddCategoryEvent(categoryModel));
      getIt<Talker>().info('Добавлена категория: $name');
      Navigator.pop(context);
    }
  }
}
