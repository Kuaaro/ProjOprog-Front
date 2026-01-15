import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/feedback/use_case/ifeedback_uc.dart';
import 'package:proj_oprog_front/feedback/view/feedback_details_dialog.dart';
import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class FeedbackListDialog extends StatefulWidget {
  final int datasetId;

  const FeedbackListDialog({super.key, required this.datasetId});

  @override
  State<FeedbackListDialog> createState() => _FeedbackListDialogState();
}

class _FeedbackListDialogState extends State<FeedbackListDialog> {
  late Future<List<NamedIdPair>> _feedbackListFuture;

  @override
  void initState() {
    super.initState();
    _loadFeedback();
  }

  void _loadFeedback() {
    _feedbackListFuture =
        GetIt.instance<IFeedbackUseCase>().getUserFeedbackList(widget.datasetId);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('User Feedback'),
      content: SizedBox(
        width: double.maxFinite,
        child: FutureBuilder<List<NamedIdPair>>(
          future: _feedbackListFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final feedbackList = snapshot.data!;

            if (feedbackList.isEmpty) {
              return const Center(child: Text('No feedback found.'));
            }

            return ListView.separated(
              itemCount: feedbackList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final item = feedbackList[index];
                return ListTile(
                  leading: const Icon(Icons.message),
                  title: Text(item.name),
                  subtitle: Text('ID: ${item.id}'),
                  onTap: () async {
                    final deleted = await showDialog<bool>(
                      context: context,
                      builder: (context) =>
                          FeedbackDetailsDialog(feedbackId: item.id),
                    );

                    if (deleted == true) {
                       setState(() {
                         _loadFeedback();
                       });
                    }
                  },
                );
              },
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
