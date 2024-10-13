import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:untitled/features/homeScreen/cubit/tasks_cubit.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: SizedBox(
        height: .9.sh,
        child: MobileScanner(onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
              print(capture.barcodes[0].rawValue);
            print(barcode.rawValue ?? "No Data found in QR");
             TasksCubit.get(context).getTaskWithId(barcode.rawValue, context);
          }
        }),
      ),
    );
  }
}
