import 'package:boli/screens/transfer_voucher/receiver_section.dart';
import 'package:boli/screens/transfer_voucher/send_section.dart';
import 'package:boli/screens/transfer_voucher/voucher_header_section.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../models/user.dart';

class TransferVoucherScreen extends StatelessWidget {
  final User userSend;
  final User userReceiver;
  final String valueToTransfer;
  const TransferVoucherScreen({required this.userReceiver, required this.userSend, required this.valueToTransfer, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(BoxIcons.bx_share_alt))
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: VoucherHeaderSection(valueToTransfer),
            ),
            SliverToBoxAdapter(
              child: ReceiverSection(userReceiver),
            ),
            SliverToBoxAdapter(
              child: SendSectionVoucher(userSend),
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.grey[300]!,
            //     ),
            //     child: ,
            //   ),
            // )
          ],
        ));
  }
}