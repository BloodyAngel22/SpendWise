import 'package:app/core/route/app_router.dart';
import 'package:app/features/category/application/bloc/category_bloc.dart';
import 'package:app/features/spend/application/bloc/spend_bloc.dart';
import 'package:app/features/spend/presentation/spend_list/widgets/spend_list.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SpendListScreen extends StatelessWidget {
  const SpendListScreen({super.key});

  // TODO: добавить поиск по textfield, а также фильтрацию по категориям и дате

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryBloc, CategoryState>(
      listener: (context, state) {
        if (state is CategoryDeletedState || state is CategoryUpdatedState) {
          context.read<SpendBloc>().add(GetSpendsEvent());
        }
      },
      child: Scaffold(
        body: BlocBuilder<SpendBloc, SpendState>(
          builder: (context, state) {
            if (state is SpendLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SpendsLoadedState) {
              return SpendList(spends: state.spends);
            }
            if (state is SpendErrorState) {
              return Center(child: Text('Ошибка. ${state.message}'));
            }
            return Container();
          },
        ),
        floatingActionButton: Builder(
          builder: (innerContext) => FloatingActionButton(
            heroTag: 'addSpend',
            onPressed: () => AutoRouter.of(
              context,
            ).push(AddSpendRoute(spendBloc: innerContext.read<SpendBloc>())),
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
