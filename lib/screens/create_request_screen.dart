import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/create_request_buttons.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/create_request_header.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/date_picker.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/leave_reason.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/type_of_leave_selector.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/view_permission_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CreateRequestScreen extends HookWidget {
  const CreateRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1750),
    );

    useEffect(() {
      animationController.forward();
      return null;
    }, const []);

    useAnimation(animationController);

    final animations = <Animation<double>>[
      for (double begin = 0.1; begin < 0.8; begin += 0.1)
        Tween<double>(begin: 500.0, end: 0.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval(begin - 0.1, begin + 0.1, curve: Curves.easeOut),
          ),
        ),
    ];

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(animations[0].value, 0),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 40, top: 18),
                  child: CreateRequestHeader(),
                ),
              ),
              Transform.translate(
                offset: Offset(animations[1].value, 0),
                child: const TypeOfLeaveSelector(),
              ),
              Transform.translate(
                offset: Offset(animations[2].value, 0),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: DatePicker(),
                ),
              ),
              Transform.translate(
                offset: Offset(animations[3].value, 0),
                child: const LeaveReason(),
              ),
              Transform.translate(
                offset: Offset(animations[4].value, 0),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Who can view my request?'),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(animations[5].value, 0),
                child: const ViewPermissionSelector(),
              ),
              const Expanded(flex: 2, child: SizedBox()),
              Transform.translate(
                offset: Offset(animations[6].value, 0),
                child: const CreateRequestButtons(),
              ),
              const Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
