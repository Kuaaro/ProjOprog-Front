import 'package:proj_oprog_front/feedback/dto/data_related_request_dto.dart';
import 'package:proj_oprog_front/feedback/dto/dataset_comment_dto.dart';

class FeedbackService {
  Future<void> sendDataRelatedRequest(DataRelatedRequestDto request) async {
    // Mock implementation - in real app this would call an API
    print('Sending DataRelatedRequest: ${request.toJson()}');
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> sendDatasetComment(DatasetCommentDto comment) async {
    // Mock implementation - in real app this would call an API
    print('Sending DatasetComment: ${comment.toJson()}');
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
