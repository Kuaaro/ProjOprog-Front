import 'package:flutter/material.dart';

class VMetadataWindow extends StatelessWidget {
  const VMetadataWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Metadata')),
      body: Column(children: [Text('*Views of metadata*')]),
    );
  }
}
