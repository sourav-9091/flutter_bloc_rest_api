part of 'fetch_bloc.dart';

sealed class FetchState extends Equatable {
  const FetchState();
  
  @override
  List<Object> get props => [];
}

final class FetchInitial extends FetchState {}
