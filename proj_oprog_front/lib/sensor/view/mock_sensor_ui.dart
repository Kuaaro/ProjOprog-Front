import 'package:flutter/material.dart';
import 'package:proj_oprog_front/config/locator.dart';
import 'package:proj_oprog_front/sensor/dto/create_sensor_router_request.dart';
import 'package:proj_oprog_front/sensor/dto/send_data_request.dart';
import 'package:proj_oprog_front/sensor/event/iadd_sensor_router_event_controller.dart';
import 'package:proj_oprog_front/sensor/event/isend_sensor_data_event_controller.dart';
import 'package:proj_oprog_front/sensor/view_model/add_sensor_router_view_model.dart';
import 'package:proj_oprog_front/sensor/view_model/send_sensor_data_view_model.dart';

class MockSensorUI extends StatelessWidget {
  const MockSensorUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mock Sensor Control Panel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildStatusPanel(),
            const SizedBox(height: 32),
            _buildAddSensorsSection(context),
            const SizedBox(height: 32),
            _buildSendDataSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusPanel() {
    return Column(
      children: [
        AnimatedBuilder(
          animation: locator<AddSensorRouterViewModel>(),
          builder: (context, child) {
            final viewModel = locator<AddSensorRouterViewModel>();
            if (viewModel.message == null || viewModel.message!.isEmpty) {
              return const SizedBox.shrink();
            }
            return Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: viewModel.isError ? Colors.red.shade50 : Colors.green.shade50,
                border: Border.all(
                  color: viewModel.isError ? Colors.red : Colors.green,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    viewModel.isError ? Icons.error : Icons.check_circle,
                    color: viewModel.isError ? Colors.red : Colors.green,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      viewModel.message!,
                      style: TextStyle(
                        color: viewModel.isError ? Colors.red : Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: locator<SendSensorDataViewModel>(),
          builder: (context, child) {
            final viewModel = locator<SendSensorDataViewModel>();
            if (viewModel.message == null || viewModel.message!.isEmpty) {
              return const SizedBox.shrink();
            }
            return Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: viewModel.isError ? Colors.red.shade50 : Colors.green.shade50,
                border: Border.all(
                  color: viewModel.isError ? Colors.red : Colors.green,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    viewModel.isError ? Icons.error : Icons.check_circle,
                    color: viewModel.isError ? Colors.red : Colors.green,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      viewModel.message!,
                      style: TextStyle(
                        color: viewModel.isError ? Colors.red : Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildAddSensorsSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Sensors',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This will add two sensors:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• Sensor ID: 1, Dataset ID: 1'),
                  Text('• Sensor ID: 1, Dataset ID: 2'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _handleAddSensors(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'Add Sensors',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSendDataSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Send Mock Sensor Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDataButton(
                  context,
                  'SendDataA',
                  'Sensor ID: 1, Data: {"integer":3}',
                  () => _handleSendDataA(context),
                  Colors.blue.shade700,
                ),
                const SizedBox(height: 12),
                _buildDataButton(
                  context,
                  'SendDataB',
                  'Sensor ID: 1, Data: {"string": "abcd"}',
                  () => _handleSendDataB(context),
                  Colors.purple.shade700,
                ),
                const SizedBox(height: 12),
                 _buildDataButton(
                  context,
                  'SendBlankData',
                  'Sensor ID: 1, Data: {}',
                  () => _handleSendBlankData(context),
                  Colors.blueGrey.shade700,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataButton(
    BuildContext context,
    String label,
    String description,
    VoidCallback onPressed,
    Color backgroundColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
          ),
          child: Text(label, style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  void _handleAddSensors(BuildContext context) {
    final controller = locator<IAddSensorRouterEventController>();
    
    final request1 = CreateSensorRouterRequest(
      sensorId: 1,
      datasetId: 1,
    );
    controller.onConfirmAddSensorRouter(request1);

    final request2 = CreateSensorRouterRequest(
      sensorId: 1,
      datasetId: 2,
    );
    controller.onConfirmAddSensorRouter(request2);
  }

  void _handleSendDataA(BuildContext context) {
    final request = SendDataRequest(
      sensorId: 1,
      data: '{"integer":3}',
    );

    locator<ISendSensorDataEventController>()
        .onSendDataPressed(request, 1);
  }

  void _handleSendDataB(BuildContext context) {
    final request = SendDataRequest(
      sensorId: 1,
      data: '{"string":"abcd"}',
    );

    locator<ISendSensorDataEventController>()
        .onSendDataPressed(request, 2);
  }

    void _handleSendBlankData(BuildContext context) {
    final request = SendDataRequest(
      sensorId: 1,
      data: '{}',
    );

    locator<ISendSensorDataEventController>()
        .onSendDataPressed(request, 2);
  }
}
