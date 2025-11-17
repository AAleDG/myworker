import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myworkers/core/l10n/l10n.dart';
import 'package:myworkers/core/utils/common_icon.dart';
import 'package:myworkers/domain/user/user_entity.dart';
import 'package:myworkers/features/home/cubit/home_cubit.dart';
import 'package:myworkers/features/home/widgets/navigation_bar_item_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  final UserEntity? user;
  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await context.read<HomeCubit>().getCurrentUser(widget.user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.blueGrey,
            selectedItemColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            onTap: (newIndex) =>
                context.read<HomeCubit>().updateIndex(newIndex),
            items: [
              BottomNavigationBarItem(
                icon: NavigationBarItemWidget(
                  iconPath: AppIcon.user,
                  isSelected: state.index == 0,
                ),
                label: context.l10nCore.homePagePersonalInfo,
              ),
              BottomNavigationBarItem(
                icon: NavigationBarItemWidget(
                  iconPath: AppIcon.request,
                  isSelected: state.index == 1,
                ),
                label: context.l10nCore.homePageRequest,
              ),
              BottomNavigationBarItem(
                icon: NavigationBarItemWidget(
                  iconPath: AppIcon.profile,
                  isSelected: state.index == 2,
                ),
                label: context.l10nCore.homePageProfile,
              ),
            ],
          ),
          body: context.read<HomeCubit>().bodyWidget(),
        );
      },
    );
  }
}
