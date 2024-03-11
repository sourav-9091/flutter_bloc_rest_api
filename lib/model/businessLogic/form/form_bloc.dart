import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hrms/model/businessLogic/form/form_event.dart';
import 'package:hrms/model/businessLogic/form/form_state.dart';
import 'package:hrms/model/repository/formSubmission.dart';

final FlutterSecureStorage storage = new FlutterSecureStorage();

class FormSubmissionBloc extends Bloc<FormSubmissionEvent, FormSubmissionState> {
  final FormUploadRepository formUploadRepository;

  FormSubmissionBloc({required this.formUploadRepository}) : super(FormSubmissionInitial());

  @override
  Stream<FormSubmissionState> mapEventToState(FormSubmissionEvent event) async* {
    if (event is SubmitForm) {
      yield FormSubmitting();
      try {
        final bool isSuccess = await formUploadRepository.submitFormData(formData: event.formData);
        if (isSuccess) {
          yield FormSubmissionSuccess();
        } else {
          yield FormSubmissionFailure("Internal Server Error: Please Try Again Later");
        }
      } catch (e) {
        yield FormSubmissionFailure("Internal Server Error: Please Try Again Later");
      }
    }
  }
}
