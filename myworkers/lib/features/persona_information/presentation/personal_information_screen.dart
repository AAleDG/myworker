import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/core/common_widgets/app_text.dart';
import 'package:myworkers/core/l10n/l10n.dart';
import 'package:myworkers/core/utils/common_style.dart';
import 'package:myworkers/domain/export_entity.dart';

@RoutePage()
class PersonalInformationScreen extends StatelessWidget {
  final UserEntity? user;
  const PersonalInformationScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              AppText(
                context.l10nCore.personalInfoPageTitle,
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              AppText(
                context.l10nCore.personalInfoPageEmail,
                style: CommonTextStyle.standard.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              AppText(
                '${user?.email}',
                style: CommonTextStyle.standard.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              AppText(
                context.l10nCore.personalInfoPageName,
                style: CommonTextStyle.standard.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              AppText(
                '${user?.name}',
                style: CommonTextStyle.standard.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              AppText(
                context.l10nCore.personalInfoPageSurname,
                style: CommonTextStyle.standard.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              AppText(
                '${user?.surname}',
                style: CommonTextStyle.standard.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              AppText(
                context.l10nCore.personalInfoPagePhone,
                style: CommonTextStyle.standard.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              AppText(
                '${user?.phoneNumber}',
                style: CommonTextStyle.standard.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              AppText(
                context.l10nCore.personalInfoPageCF,
                style: CommonTextStyle.standard.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              AppText(
                '${user?.cf}',
                style: CommonTextStyle.standard.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
