import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fetch_data_controller.dart';

class FetchDataPage extends GetView<FetchDataController> {
  const FetchDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FetchDataPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FetchDataPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
