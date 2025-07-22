import 'package:app/features/category/application/usecases/category_usecases.dart';
import 'package:app/features/category/domain/entities/category.dart';
import 'package:app/features/category/infrastructure/datamodels/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'category_events.dart';
part 'category_states.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryUsecases categoryUsecases;
  final Talker _talker;

  CategoryBloc(
    this._talker,
    this.categoryUsecases,
  ) : super(CategoryInitialState()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        final categories = await categoryUsecases.getCategories();
        emit(CategoriesLoadedState(categories));
      } catch (exception, stackTrace) {
        _talker.handle(exception, stackTrace);
        emit(CategoryErrorState(exception.toString()));
      }
    });

    on<AddCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        await categoryUsecases.addCategory(event.category);
        final categories = await categoryUsecases.getCategories();
        emit(CategoriesLoadedState(categories));
      } catch (exception, stackTrace) {
        _talker.handle(exception, stackTrace);
        emit(CategoryErrorState(exception.toString()));
      }
    });

    on<DeleteCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        await categoryUsecases.deleteCategory(event.categoryId);
        emit(CategoryDeletedState());
        final categories = await categoryUsecases.getCategories();
        emit(CategoriesLoadedState(categories));
      } catch (exception, stackTrace) {
        _talker.handle(exception, stackTrace);
        emit(CategoryErrorState(exception.toString()));
      }
    });

    on<UpdateCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        await categoryUsecases.updateCategory(event.category);
        emit(CategoryUpdatedState());
        final categories = await categoryUsecases.getCategories();
        emit(CategoriesLoadedState(categories));
      } catch (exception, stackTrace) {
        _talker.handle(exception, stackTrace);
        emit(CategoryErrorState(exception.toString()));
      }
    });
  }
}
