import 'package:crazycar/core/get_it/get_it.dart';
import 'package:crazycar/features/rider/home/presentation/cubit/rider_home_cubit.dart';
import 'package:crazycar/features/rider/home/presentation/widget/search_location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.placemark});
  final Placemark? placemark;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchFromController = TextEditingController();
  TextEditingController searchToController = TextEditingController();
  @override
  void initState() {
    searchFromController.text = widget.placemark?.locality ?? "";
    super.initState();
  }

  @override
  void dispose() {
    searchFromController.dispose();
    searchToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<RiderHomeCubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
          child: Column(
            children: [
              SearchLocationWidget(
                searchFromController: searchFromController,
                searchToController: searchToController,
              ),
              Gap(20.0.h),
              BlocConsumer<RiderHomeCubit, RiderHomeState>(
                buildWhen:
                    (previous, current) =>
                        current is SearchSuccess ||
                        current is SearchError ||
                        current is SearchLoading,
                listener: (context, state) {
                  if (state is SearchSuccess) {
                  } else if (state is SearchError) {
                  } else if (state is SearchLoading) {}
                },
                builder: (context, state) {
                  final cubit = getIt<RiderHomeCubit>();
                  if (state is SearchSuccess) {
                    final loc = state.locations;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.locations.length,
                        itemBuilder:
                            (context, index) => ListTile(
                              onTap: () {
                                if (cubit.isScearch == false) {
                                  cubit.requestTrips(loc[index]);
                                }
                                // context.pop();
                              },
                              title: Text(
                                state.locations[index].placeMark?.locality ??
                                    "",
                              ),
                              subtitle: Text(
                                state.locations[index].placeMark?.street ?? "",
                              ),
                            ),
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
