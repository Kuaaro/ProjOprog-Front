import 'package:proj_oprog_front/feedback/dto/create_user_feedback_dto.dart';
import 'package:proj_oprog_front/feedback/dto/user_feedback_details_dto.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class FeedbackService {
   
  final List<UserFeedbackDetailsDto> _feedbackStore = [];
  int _nextId = 1;

  Future<void> createUserFeedback(CreateUserFeedbackDto feedback) async {
     
    await Future.delayed(const Duration(milliseconds: 500));
    
    final newFeedback = UserFeedbackDetailsDto(
      userFeedbackId: _nextId++,
      contactPoint: feedback.contactPoint,
      message: feedback.message,
      datasetId: feedback.datasetId,
    );
    
    _feedbackStore.add(newFeedback);
    print('Feedback stored: ${newFeedback.userFeedbackId}');
  }

  Future<List<NamedIdPair>> getUserFeedbackList(int datasetId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    
    return _feedbackStore
        .where((f) => f.datasetId == datasetId)
        .map((f) => NamedIdPair(
              name: f.message.length > 30 
                  ? '${f.message.substring(0, 30)}...' 
                  : f.message,
              id: f.userFeedbackId,
            ))
        .toList();
  }

  Future<UserFeedbackDetailsDto> getUserFeedbackDetails(int userFeedbackId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _feedbackStore.firstWhere(
      (f) => f.userFeedbackId == userFeedbackId,
      orElse: () => throw Exception('Feedback not found'),
    );
  }

  Future<void> deleteUserFeedback(int userFeedbackId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _feedbackStore.removeWhere((f) => f.userFeedbackId == userFeedbackId);
  }
}
