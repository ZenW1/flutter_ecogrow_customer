import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableWidget extends StatelessWidget {
  const SlidableWidget({super.key, this.onPressedOne,required this.child});

  final Function(BuildContext)? onPressedOne;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: onPressedOne,
            borderRadius: BorderRadius.circular(10),
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      child: child,
    );
  }
}
