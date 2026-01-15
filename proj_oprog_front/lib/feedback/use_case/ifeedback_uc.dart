import 'package:proj_oprog_front/feedback/dto/create_user_feedback_dto.dart';
import 'package:proj_oprog_front/feedback/dto/user_feedback_details_dto.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

abstract class IFeedbackUseCase {
  Future<void> createUserFeedback(CreateUserFeedbackDto feedback);
  Future<List<NamedIdPair>> getUserFeedbackList(int datasetId);
  Future<UserFeedbackDetailsDto> getUserFeedbackDetails(int userFeedbackId);
  Future<void> deleteUserFeedback(int userFeedbackId);
}

