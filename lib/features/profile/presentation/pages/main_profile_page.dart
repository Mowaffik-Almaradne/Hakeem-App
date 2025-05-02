import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/show_dialog/main_show_dialog_widget.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/delete_account_cubit/delete_account_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/logout_cubit/logout_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/logic/profile_logic.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/bacground_profile.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/card_main_profile.dart';
import 'package:hosptel_app/router/app_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    //? Button For Back :
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.pushReplacementNamed(
          context,
          RouteNamedScreens.homeScreenNameRoute,
        );
        context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
      },
      child: MainBackGround(
        mainBody: SingleChildScrollView(
          child: Column(
            children: [
              //? Back Ground Profile :
              const BackGroundProfile(
                textBackGround: AppWordManger.profile,
                visibleIcon: false,
              ),
              //? Info Account :
              CardMainProfile(
                text: AppWordManger.infoAccount,
                paddingLeft: 125,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.infoProfileNameRoute,
                  );
                },
              ),
              //? Change Password :
              CardMainProfile(
                paddingLeft: 140,
                text: AppWordManger.changePassword,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.changePasswordNameRoute,
                  );
                },
              ),
              //? Edit Number :
              CardMainProfile(
                paddingLeft: 165,
                text: AppWordManger.updateMyNumber,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNamedScreens.editNumberNameRoute,
                  );
                },
              ),
              //? Delete My Account :
              BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
                listener: (context, state) => ProfileLogic()
                    .listenerDeleteAccount(context: context, state: state),
                builder: (context, state) {
                  return CardMainProfile(
                    paddingLeft: 160,
                    text: AppWordManger.deleteAccount,
                    onTap: () {
                      MainShowDialog.customShowDialog(
                        context,
                        firstButtonText: AppWordManger.yes,
                        secoundButtonText: AppWordManger.no,
                        textPopUp: AppWordManger.areYoueSureDeletedAccount,
                        onTapFirst: () {
                          context.read<DeleteAccountCubit>().deleteAccount();
                        },
                        onTapSecound: () => Navigator.pop(context),
                      );
                    },
                  );
                },
              ),
              //? Logout Button :
              BlocConsumer<LogoutCubit, LogoutState>(
                listener: (context, state) => ProfileLogic()
                    .listenelogout(context: context, state: state),
                builder: (context, state) {
                  if (state.status == DeafultBlocStatus.loading) {
                    return const MainLoadignWidget();
                  }
                  return MainElevatedButton(
                    raduiseBorder: 10,
                    horizontalPadding: 70.w,
                    paddingOut: EdgeInsets.only(top: 15.h),
                    text: AppWordManger.logout,
                    backgroundColor: AppColorManger.secoundryColor,
                    textColor: AppColorManger.white,
                    onPreesed: () {
                      context.read<LogoutCubit>().logout();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
