part of 'home_screen_bloc.dart';

@freezed
class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.started() = Started;
  const factory HomeScreenEvent.fetchData({required String querry}) = FetchData;
}
