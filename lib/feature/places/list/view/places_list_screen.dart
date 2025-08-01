import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/feature/places/list/bloc/places_list_bloc.dart';
import 'package:surf_places/feature/places/list/view/widgets/place_card_widget.dart';
import 'package:surf_places/feature/places/list/view/widgets/search_widget.dart';

class PlacesListScreen extends StatefulWidget {
  const PlacesListScreen({super.key});

  @override
  State<PlacesListScreen> createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  late PlacesListBloc _bloc;

  @override
  void initState() {
    _bloc = PlacesListBloc()..add(GetPlacesListEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Список интересных мест',
            style: context.textExt.subtitle,
          ),
          centerTitle: true,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SearchWidget(),
            ),
          ),
        ),
        body: BlocBuilder<PlacesListBloc, PlacesListState>(
          builder: (context, state) {
            if (state is PlacesListLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PlacesListError) {
              return Center(
                child: Text(
                  state.error,
                  style: context.textExt.subtitle.copyWith(
                    color: context.colorExt.importantColor,
                  ),
                ),
              );
            }
            if (state is PlacesListLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: RefreshIndicator(
                  onRefresh: () async {
                    _bloc.add(GetPlacesListEvent());
                  },
                  child: ListView.separated(
                    itemCount: state.places.length,
                    separatorBuilder: (context, index) => SizedBox(height: 24),
                    itemBuilder: (context, index) =>
                        PlaceCardWidget(place: state.places[index]),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
