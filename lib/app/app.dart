// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pal_prashnotarri_teacher/app/appLocalization.dart';
import 'package:pal_prashnotarri_teacher/app/routes.dart';
import 'package:pal_prashnotarri_teacher/features/localization/appLocalizationCubit.dart';
import 'package:pal_prashnotarri_teacher/features/settings/settingsCubit.dart';
import 'package:pal_prashnotarri_teacher/features/settings/settingsLocalDataSource.dart';
import 'package:pal_prashnotarri_teacher/features/settings/settingsRepository.dart';
import 'package:pal_prashnotarri_teacher/features/systemConfig/cubits/systemConfigCubit.dart';
import 'package:pal_prashnotarri_teacher/features/systemConfig/systemConfigRepository.dart';
import 'package:pal_prashnotarri_teacher/ui/styles/theme/appTheme.dart';
import 'package:pal_prashnotarri_teacher/ui/styles/theme/themeCubit.dart';
import 'package:pal_prashnotarri_teacher/utils/constants.dart';
import 'package:pal_prashnotarri_teacher/utils/uiUtils.dart';

Future<Widget> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));

    //  await Firebase.initializeApp();
    //  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
  }

  await Hive.initFlutter();
  await Hive.openBox(
      authBox); //auth box for storing all authentication related details
  await Hive.openBox(
      settingsBox); //settings box for storing all settings details
  await Hive.openBox(
      userdetailsBox); //userDetails box for storing all userDetails details
  await Hive.openBox(examBox);

  return MyApp();
}

class GlobalScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return BouncingScrollPhysics();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(UiUtils.getImagePath("splash_logo.png")), context);
    precacheImage(AssetImage(UiUtils.getImagePath("map_finded.png")), context);
    precacheImage(AssetImage(UiUtils.getImagePath("map_finding.png")), context);
    precacheImage(
        AssetImage(UiUtils.getImagePath("scratchCardCover.png")), context);

    return MultiBlocProvider(
      //providing global providers
      providers: [
        //Creating cubit/bloc that will be use in whole app or
        //will be use in multiple screens
        BlocProvider<ThemeCubit>(
            create: (_) => ThemeCubit(SettingsLocalDataSource())),
        BlocProvider<SettingsCubit>(
            create: (_) => SettingsCubit(SettingsRepository())),
        //  BlocProvider<AuthCubit>(create: (_) => AuthCubit(AuthRepository())),
        BlocProvider<AppLocalizationCubit>(
            create: (_) => AppLocalizationCubit(SettingsLocalDataSource())),
        //   BlocProvider<UserDetailsCubit>(
        //       create: (_) => UserDetailsCubit(ProfileManagementRepository())),
        //   //bookmark quesitons of quiz zone
        //   BlocProvider<BookmarkCubit>(
        //       create: (_) => BookmarkCubit(BookmarkRepository())),
        //   //bookmark quesitons of guess the word
        //   BlocProvider<GuessTheWordBookmarkCubit>(
        //       create: (_) => GuessTheWordBookmarkCubit(BookmarkRepository())),

        //   //audio question bookmark cubit
        //   BlocProvider<AudioQuestionBookmarkCubit>(
        //       create: (_) => AudioQuestionBookmarkCubit(BookmarkRepository())),

        //   //it will be use in multiple dialogs and screen
        //   BlocProvider<MultiUserBattleRoomCubit>(
        //       create: (_) => MultiUserBattleRoomCubit(BattleRoomRepository())),

        //   BlocProvider<BattleRoomCubit>(
        //       create: (_) => BattleRoomCubit(BattleRoomRepository())),

        //system config
        BlocProvider<SystemConfigCubit>(
            create: (_) => SystemConfigCubit(SystemConfigRepository())),
        //   //to configure badges
        //   BlocProvider<BadgesCubit>(
        //       create: (_) => BadgesCubit(BadgesRepository())),
        //   //statistic cubit
        //   BlocProvider<StatisticCubit>(
        //       create: (_) => StatisticCubit(StatisticRepository())),
        //   //Interstitial ad cubit
        //   BlocProvider<InterstitialAdCubit>(create: (_) => InterstitialAdCubit()),
        //   //Rewarded ad cubit
        //   BlocProvider<RewardedAdCubit>(create: (_) => RewardedAdCubit()),
        //   //tournament cubit
        //   BlocProvider<TournamentCubit>(
        //       create: (_) => TournamentCubit(TournamentRepository())),
        //   //tournament battle cubit
        //   BlocProvider<TournamentBattleCubit>(
        //       create: (_) => TournamentBattleCubit(TournamentRepository())),
        //   //exam cubit
        //   BlocProvider<ExamCubit>(create: (_) => ExamCubit(ExamRepository())),

        //   //Setting this cubit globally so we can fetch again once
        //   //set quiz categories success
        //   BlocProvider<ComprehensionCubit>(
        //     create: (_) => ComprehensionCubit(QuizRepository()),
        //   ),

        //   //
        //   //Setting this cubit globally so we can fetch again once
        //   //set quiz categories success
        //   BlocProvider<QuizCategoryCubit>(
        //       create: (_) => QuizCategoryCubit(QuizRepository())),

        //   //
        //   //Setting this cubit globally so we can fetch again once
        //   //set quiz categories success
        //   BlocProvider<SubCategoryCubit>(
        //       create: (_) => SubCategoryCubit(QuizRepository()))
      ],
      child: Builder(
        builder: (context) {
          //Watching themeCubit means if any change occurs in themeCubit it will rebuild the child
          final currentTheme = context.watch<ThemeCubit>().state.appTheme;
          //

          final currentLanguage =
              context.watch<AppLocalizationCubit>().state.language;

          return MaterialApp(
            builder: (context, widget) {
              return ScrollConfiguration(
                  behavior: GlobalScrollBehavior(), child: widget!);
            },
            locale: currentLanguage,
            theme: appThemeData[currentTheme]!.copyWith(
                textTheme:
                    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: supporatedLocales.map((languageCode) {
              return UiUtils.getLocaleFromLanguageCode(languageCode);
            }).toList(),
            initialRoute: Routes.splash,
            onGenerateRoute: Routes.onGenerateRouted,
          );
        },
      ),
    );
  }
}
