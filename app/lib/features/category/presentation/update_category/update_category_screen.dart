import 'package:app/features/category/application/validators/category_validator.dart';
import 'package:app/features/category/application/bloc/category_bloc.dart';
import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/category/domain/irepositories/i_category_repository.dart';
import 'package:app/features/category/infrastructure/datamodels/category_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:app/generated/l10n.dart';

@RoutePage()
class UpdateCategoryScreen extends StatefulWidget {
  final CategoryBloc categoryBloc;
  final Category category;

  const UpdateCategoryScreen({
    super.key,
    required this.categoryBloc,
    required this.category,
  });

  @override
  State<UpdateCategoryScreen> createState() => _UpdateCategoryScreenState();
}

class _UpdateCategoryScreenState extends State<UpdateCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    _loadCategories();
    _loadController();
  }

  Future<void> _loadCategories() async {
    categories = await GetIt.I<ICategoryRepository>().getCategories();
  }

  void _loadController() {
    _nameController.text = widget.category.title;
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
        title: Text(S.of(context).updateCategoryTitle, style: theme.textTheme.titleMedium),
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
                  labelText: S.of(context).categoryTitleLabel,
                  hintText: S.of(context).categoryTitleHint,
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
      final name = _nameController.text;

      final categoryModel = CategoryModel(
        id: widget.category.id,
        title: name,
      );

      widget.categoryBloc.add(UpdateCategoryEvent(categoryModel));
      getIt<Talker>().info('Добавлена категория: ${categoryModel.title}');
      Navigator.pop(context);
    }
  }
}
