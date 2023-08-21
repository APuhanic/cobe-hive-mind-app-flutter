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

    final headerAnimation = Tween<double>(begin: 500.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.100, curve: Curves.easeOut),
      ),
    );

    final typeOfLeaveAnimation = Tween<double>(begin: 500.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.100, 0.200, curve: Curves.easeOut),
      ),
    );

    final datePickerAnimation = Tween<double>(begin: 500.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.200, 0.300, curve: Curves.easeOut),
      ),
    );

    final reasonAnimation = Tween<double>(begin: 500.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.300, 0.400, curve: Curves.easeOut),
      ),
    );

    final viewPermissionTitleAnimation =
        Tween<double>(begin: 500.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.400, 0.500, curve: Curves.easeOut),
      ),
    );

    final viewPermissionSelectorAnimation =
        Tween<double>(begin: 500.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.500, 0.600, curve: Curves.easeOut),
      ),
    );

    final buttonAnimation = Tween<double>(begin: 500.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.600, 0.700, curve: Curves.easeOut),
      ),
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(headerAnimation.value, 0),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 40, top: 18),
                  child: CreateRequestHeader(),
                ),
              ),
              Transform.translate(
                offset: Offset(typeOfLeaveAnimation.value, 0),
                child: const TypeOfLeaveSelector(),
              ),
              Transform.translate(
                offset: Offset(datePickerAnimation.value, 0),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: DatePicker(),
                ),
              ),
              Transform.translate(
                offset: Offset(reasonAnimation.value, 0),
                child: const LeaveReason(),
              ),
              Transform.translate(
                offset: Offset(viewPermissionTitleAnimation.value, 0),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Who can view my request?'),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(viewPermissionSelectorAnimation.value, 0),
                child: const ViewPermissionSelector(),
              ),
              const Expanded(flex: 2, child: SizedBox()),
              Transform.translate(
                offset: Offset(buttonAnimation.value, 0),
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
