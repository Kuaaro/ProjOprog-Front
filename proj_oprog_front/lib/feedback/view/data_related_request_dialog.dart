import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/feedback/dto/create_user_feedback_dto.dart';
import 'package:proj_oprog_front/feedback/service/feedback_service.dart';

class DataRelatedRequestDialog extends StatefulWidget {
  final int? datasetId;

  const DataRelatedRequestDialog({Key? key, this.datasetId}) : super(key: key);

  @override
  State<DataRelatedRequestDialog> createState() => _DataRelatedRequestDialogState();
}

class _DataRelatedRequestDialogState extends State<DataRelatedRequestDialog> {
  final _formKey = GlobalKey<FormState>();
  final _contentController = TextEditingController();
  final _contactPointController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _contentController.dispose();
    _contactPointController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final feedback = CreateUserFeedbackDto(
          contactPoint: _contactPointController.text,
          message: _contentController.text,
          datasetId: 0,
        );

        await GetIt.instance<FeedbackService>().createUserFeedback(feedback);

        if (mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Request submitted successfully')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error submitting request: $e')),
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
      title: const Text('New Data Related Request'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               TextFormField(
                controller: _contactPointController,
                decoration: const InputDecoration(
                  labelText: 'Contact Point (Email)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter contact info';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(
                  labelText: 'Request Content',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the request details';
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
