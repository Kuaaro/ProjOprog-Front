import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:proj_oprog_front/dataset/event/dataset_event_controller.dart';
import 'package:proj_oprog_front/dataset/view_model/dataset_preview_view_model.dart';
import 'package:proj_oprog_front/feedback/view/dataset_comment_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class UserDatasetView extends StatefulWidget {
  final int datasetId;

  const UserDatasetView({Key? key, required this.datasetId}) : super(key: key);

  @override
  State<UserDatasetView> createState() => _UserDatasetViewState();
}

class _UserDatasetViewState extends State<UserDatasetView> {
  late final DatasetEventController _controller;
  late final DatasetPreviewViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.instance<DatasetEventController>();
    _viewModel = GetIt.instance<DatasetPreviewViewModel>();

    _controller.onPreviewDataset(widget.datasetId);
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
   
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        if (_viewModel.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (_viewModel.errorMessage != null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(child: Text(_viewModel.errorMessage!)),
          );
        }

        final dataset = _viewModel.dataset;
        if (dataset == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Not Found')),
            body: const Center(child: Text('Dataset not found')),
          );
        }

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go('/user/catalog'),
            ),
            title: Text(dataset.name),
            actions: [
              IconButton(
                icon: const Icon(Icons.comment),
                tooltip: 'Add Comment',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => DatasetCommentDialog(datasetId: widget.datasetId),
                  );
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Description'),
                Text(dataset.desc),
                const SizedBox(height: 16),
                
                _buildSectionTitle('Contact Point'),
                Text(dataset.contactPoint),
                const SizedBox(height: 16),
                
                _buildSectionTitle('Keywords'),
                Wrap(
                  spacing: 8,
                  children: dataset.keywords
                      .map((k) => Chip(label: Text(k)))
                      .toList(),
                ),
                const SizedBox(height: 16),

                _buildSectionTitle('Distributions'),
                if (dataset.distributions.isEmpty)
                  const Text('No distributions available')
                else
                  ...dataset.distributions.map((dist) => 
                    Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dist.description,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () => _launchURL(dist.accessURL),
                              child: Text(
                                dist.accessURL,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ),
                const SizedBox(height: 16),

                _buildSectionTitle('Data'),
                if (_viewModel.previewData != null && _viewModel.previewData!.isNotEmpty)
                  _buildDataTable(_viewModel.previewData!)
                else
                  const Text('No data available'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDataTable(List<dynamic> items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Type')),
          DataColumn(label: Text('Value')),
        ],
        rows: items.map((item) {
        
          final parsed = jsonDecode(item['data']) as Map<String, dynamic>;
          
          return DataRow(cells: [
            DataCell(Text(parsed.keys.first)),
            DataCell(Text(parsed.values.first.toString())),
          ]);
        }).toList(),
      ),
    );
  }
}