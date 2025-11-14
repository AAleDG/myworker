import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myworkers/core/common_widgets/app_text.dart';
import 'package:myworkers/core/utils/common_style.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage()
class PersonalInformationScreen extends StatelessWidget {
  final User? user;
  const PersonalInformationScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                AppText(
                  'Ecco le tue informazioni personali',
                  maxLines: 2,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: AppText(
                    'Email: ${user?.email}',
                    style: CommonTextStyle.standard.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey, width: 2.0),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: AppText(
                    'Nome: ${user?.email}',
                    style: CommonTextStyle.standard.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey, width: 2.0),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: AppText(
                    'Cognome: ${user?.actionLink}',
                    style: CommonTextStyle.standard.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey, width: 2.0),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: AppText(
                    'Phone: ${user?.actionLink}',
                    style: CommonTextStyle.standard.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey, width: 2.0),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: AppText(
                    'CF: ${user?.actionLink}',
                    style: CommonTextStyle.standard.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey, width: 2.0),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: AppText(
                    'UID: ${user?.aud}',
                    style: CommonTextStyle.standard.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    maxLines: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey, width: 2.0),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
