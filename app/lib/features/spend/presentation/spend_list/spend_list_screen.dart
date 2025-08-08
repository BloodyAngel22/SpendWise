import 'package:app/common/widgets/search_field.dart';
import 'package:app/core/route/app_router.dart';
import 'package:app/features/category/application/bloc/category_bloc.dart';
import 'package:app/features/spend/application/bloc/spend_bloc.dart';
import 'package:app/features/spend/domain/entities/spend_filter.dart';
import 'package:app/features/spend/presentation/spend_list/widgets/filter_spend_sheet.dart';
import 'package:app/features/spend/presentation/spend_list/widgets/spend_list.dart';
import 'package:app/generated/l10n.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SpendListScreen extends StatefulWidget {
  const SpendListScreen({super.key});

  @override
  State<SpendListScreen> createState() => _SpendListScreenState();
}

class _SpendListScreenState extends State<SpendListScreen> {
  String currentQuery = '';
  SpendFilter currentFilter = SpendFilter();

  void _onSearchChanged(String query) {
    setState(() => currentQuery = query);
    context.read<SpendBloc>().add(
      UpdateSpendFilterEvent(currentFilter, currentQuery),
    );
  }

  final SpendFilter initialFilter = SpendFilter();

  void _applyFilter(SpendFilter filter) {
    setState(() => currentFilter = filter);
    context.read<SpendBloc>().add(UpdateSpendFilterEvent(filter, currentQuery));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryBloc, CategoryState>(
      listener: (context, state) {
        if (state is CategoryDeletedState || state is CategoryUpdatedState) {
          context.read<SpendBloc>().add(GetSpendsEvent());
        }
      },
      child: Scaffold(
        endDrawer: FilterSpendDrawer(
          filter: initialFilter,
          onApplyFilter: _applyFilter,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: SearchField(
                  onSearchChanged: _onSearchChanged,
                  hintText: S.of(context).searchByExpenses,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Builder(
                    builder: (context) {
                      return OutlinedButton.icon(
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                        label: Text(S.of(context).filters),
                        icon: const Icon(Icons.filter_list),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<SpendBloc, SpendState>(
                  builder: (context, state) {
                    if (state is SpendLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is SpendsLoadedState) {
                      return SpendList(spends: state.spends);
                    }
                    if (state is SpendErrorState) {
                      return Center(
                        child: Text(S.of(context).error(state.message)),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
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
