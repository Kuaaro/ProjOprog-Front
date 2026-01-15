import 'package:proj_oprog_front/feedback/dto/create_user_feedback_dto.dart';
import 'package:proj_oprog_front/feedback/dto/user_feedback_details_dto.dart';
import 'package:proj_oprog_front/feedback/service/feedback_service.dart';
import 'package:proj_oprog_front/feedback/use_case/ifeedback_uc.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class FeedbackUseCase implements IFeedbackUseCase {
  final FeedbackService _service;

  FeedbackUseCase(this._service);

  @override
  Future<void> createUserFeedback(CreateUserFeedbackDto feedback) {
    return _service.createUserFeedback(feedback);
  }

  @override
  Future<List<NamedIdPair>> getUserFeedbackList(int datasetId) {
    return _service.getUserFeedbackList(datasetId);
  }

  @override
  Future<UserFeedbackDetailsDto> getUserFeedbackDetails(int userFeedbackId) {
    return _service.getUserFeedbackDetails(userFeedbackId);
  }

  @override
  Future<void> deleteUserFeedback(int userFeedbackId) {
    return _service.deleteUserFeedback(userFeedbackId);
  }
}


