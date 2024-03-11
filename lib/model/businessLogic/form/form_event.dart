import 'package:equatable/equatable.dart';

abstract class FormSubmissionEvent extends Equatable {
  const FormSubmissionEvent();
}

class SubmitForm extends FormSubmissionEvent {
  Map<String, dynamic> formData;

  SubmitForm({required this.formData});

  @override
  List<Object?> get props => [];
}
