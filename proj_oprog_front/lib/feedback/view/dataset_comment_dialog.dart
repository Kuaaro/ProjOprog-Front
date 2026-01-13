import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/feedback/dto/dataset_comment_dto.dart';
import 'package:proj_oprog_front/feedback/service/feedback_service.dart';

class DatasetCommentDialog extends StatefulWidget {
  final int datasetId;

  const DatasetCommentDialog({Key? key, required this.datasetId}) : super(key: key);

  @override
  State<DatasetCommentDialog> createState() => _DatasetCommentDialogState();
}

class _DatasetCommentDialogState extends State<DatasetCommentDialog> {
  final _formKey = GlobalKey<FormState>();
  final _contentController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final comment = DatasetCommentDto(
          content: _contentController.text,
          datasetId: widget.datasetId,
        );

        await GetIt.instance<FeedbackService>().sendDatasetComment(comment);

        if (mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Comment submitted successfully')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error submitting comment: $e')),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Comment'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(
                  labelText: 'Comment',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a comment';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? _submit : _submit,
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Submit'),
        ),
      ],
    );
  }
}
