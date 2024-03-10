import 'package:flutter/material.dart';

class VendorsScreen extends StatefulWidget {
  const VendorsScreen({super.key});

  @override
  State<VendorsScreen> createState() => _VendorsScreenState();
}

class _VendorsScreenState extends State<VendorsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("vends"),
    );
  }
}
