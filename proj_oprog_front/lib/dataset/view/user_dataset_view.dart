import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:proj_oprog_front/dataset/business_logic/idataset.dart';
import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';
import 'package:proj_oprog_front/feedback/view/dataset_comment_dialog.dart';
import 'package:go_router/go_router.dart';

class UserDatasetView extends StatefulWidget {
  final int datasetId;

  const UserDatasetView({Key? key, required this.datasetId}) : super(key: key);

  @override
  State<UserDatasetView> createState() => _UserDatasetViewState();
}

class _UserDatasetViewState extends State<UserDatasetView> {
  DatasetDto? _dataset;
  Map<String, dynamic>? _datasetData;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadDataset();
  }

  Future<void> _loadDataset() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final datasetService = GetIt.instance<IDataset>();
      
       
      final dataset = await datasetService.getDataset(widget.datasetId);
      
       
      Map<String, dynamic>? data;
      try {
        data = await datasetService.getDatasetData(widget.datasetId);
      } catch (e) {
       
        debugPrint('Error fetching data: $e');
      }

      if (mounted) {
        setState(() {
          _dataset = dataset;
          _datasetData = data;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Error loading dataset: $e';
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text(_errorMessage!)),
      );
    }

    if (_dataset == null) {
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
        title: Text(_dataset!.name),
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
            Text(_dataset!.desc),
            const SizedBox(height: 16),
            
            _buildSectionTitle('Contact Point'),
            Text(_dataset!.contactPoint),
            const SizedBox(height: 16),
            
            _buildSectionTitle('Keywords'),
            Wrap(
              spacing: 8,
              children: _dataset!.keywords
                  .map((k) => Chip(label: Text(k)))
                  .toList(),
            ),
            const SizedBox(height: 16),

            _buildSectionTitle('Data'),
             if (_datasetData != null && _datasetData!.isNotEmpty)
              _buildDataRow(_datasetData!)
            else
              const Text('No data available'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataRow(Map<String, dynamic> data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: data.entries.map((entry) {
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    entry.value.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
