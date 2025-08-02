import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_places/common/extensions/context_extensions.dart';
import 'package:surf_places/feature/places/list/bloc/places_list_bloc.dart';
import 'package:surf_places/feature/places/list/view/widgets/place_card_widget.dart';

class PlacesListBody extends StatefulWidget {
  const PlacesListBody({super.key});

  @override
  State<PlacesListBody> createState() => _PlacesListBodyState();
}

class _PlacesListBodyState extends State<PlacesListBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlacesListBloc, PlacesListState>(
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<PlacesListBloc>().add(GetPlacesListEvent());
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
    );
  }
}
