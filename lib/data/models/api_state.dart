import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_state.freezed.dart';

@freezed
class ApiState<T> with _$ApiState<T> {
  const factory ApiState.initial() = _Initial<T>;
  const factory ApiState.loading(T? dataMaybe) = _Loading<T>;
  const factory ApiState.success(T data) = _Success<T>;
  const factory ApiState.error(String error) = _Error;
}
