import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/feedback/dto/user_feedback_details_dto.dart';
import 'package:proj_oprog_front/feedback/use_case/ifeedback_uc.dart';

class FeedbackDetailsDialog extends StatelessWidget {
  final int feedbackId;

  const FeedbackDetailsDialog({super.key, required this.feedbackId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserFeedbackDetailsDto>(
      future: GetIt.instance<IFeedbackUseCase>().getUserFeedbackDetails(feedbackId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AlertDialog(
            content: SizedBox(
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (snapshot.hasError) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to load feedback details: ${snapshot.error}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          );
        }

        final feedback = snapshot.data!;

        return AlertDialog(
          title: const Text('Feedback Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'ID: ${feedback.userFeedbackId}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Contact Point:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(feedback.contactPoint),
                const SizedBox(height: 16),
                const Text(
                  'Message:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(feedback.message),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirm Delete'),
                    content: const Text(
                        'Are you sure you want to delete this feedback?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                );

                if (confirm == true) {
                  await GetIt.instance<IFeedbackUseCase>()
                      .deleteUserFeedback(feedback.userFeedbackId);
                  if (context.mounted) {
                    Navigator.of(context).pop(true);  
                  }
                }
              },
              icon: const Icon(Icons.delete),
              label: const Text('Delete'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.errorContainer,
                foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
          ],
        );
      },
    );
  }
}
