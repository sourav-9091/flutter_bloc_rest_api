import 'package:equatable/equatable.dart';

abstract class FormSubmissionState extends Equatable {
  const FormSubmissionState();

  @override
  List<Object?> get props => [];
}

class FormSubmissionInitial extends FormSubmissionState {}

class FormSubmitting extends FormSubmissionState {}

class FormSubmissionSuccess extends FormSubmissionState {}

class FormSubmissionFailure extends FormSubmissionState {
  final String error;

  const FormSubmissionFailure(this.error);

  @override
  List<Object?> get props => [error];
}
