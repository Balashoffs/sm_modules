import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sm_modules/sm_ui_kit.dart';

class CustomInformationWidget extends StatefulWidget {
  const CustomInformationWidget({
    super.key,
    required this.title,
    required this.body,
    required this.pathToFile,
  });

  final String title;
  final String body;
  final String pathToFile;

  @override
  State<CustomInformationWidget> createState() =>
      _CustomInformationWidgetState();
}

class _CustomInformationWidgetState extends State<CustomInformationWidget> {
  late final Widget _svgPicture;
  late final Widget _message;

  @override
  void initState() {
    super.initState();

    _svgPicture = SvgPicture.asset(
      widget.pathToFile,
    );

    _message = InformationBody(title: widget.title, body: widget.body);
  }

  @override
  Widget build(BuildContext context) {
    bool isSmall = AppAdaptive.of(context, AdaptiveThresholds.l512).l512;
    print('IsSmall: $isSmall');
    return isSmall
        ? VerticalInformationMessage(
            children: [_svgPicture, _message],
          )
        : HorizontalInformationMessage(
            children: [_svgPicture, _message],
          );
  }
}

class VerticalInformationMessage extends StatelessWidget {
  const VerticalInformationMessage({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}

class HorizontalInformationMessage extends StatelessWidget {
  const HorizontalInformationMessage({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}

class InformationBody extends StatelessWidget {
  const InformationBody({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    bool isSmall = AppAdaptive.of(context, AdaptiveThresholds.l512).l512;
    return Padding(
      padding:  !isSmall ? const EdgeInsets.only(left: 48.0) : const EdgeInsets.only(top: 48.0),
      child: SizedBox(
        height: 78,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AT.t.h2.copyWith(color: AppColorsLight.primary),
            ),
            Text(
              body,
              style: AT.t.b16.copyWith(
                  color: AppColorsLight.primary, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

Widget noProjects({required String title, required String body}) {
  String path =
      'packages/sm_modules/assets/images/no_available/no_projects.svg';
  return CustomInformationWidget(title: title, body: body, pathToFile: path);
}

Widget noDraws({required String title, required String body}) {
  String path = 'packages/sm_modules/assets/images/no_available/no_draws.svg';
  return CustomInformationWidget(title: title, body: body, pathToFile: path);
}

Widget noIssues({required String title, required String body}) {
  String path = 'packages/sm_modules/assets/images/no_available/no_issues.svg';
  return CustomInformationWidget(title: title, body: body, pathToFile: path);
}

Widget noModels({required String title, required String body}) {
  String path = 'packages/sm_modules/assets/images/no_available/no_models.svg';
  return CustomInformationWidget(title: title, body: body, pathToFile: path);
}

Widget noChecks({required String title, required String body}) {
  String path = 'packages/sm_modules/assets/images/no_available/no_checks.svg';
  return CustomInformationWidget(title: title, body: body, pathToFile: path);
}
