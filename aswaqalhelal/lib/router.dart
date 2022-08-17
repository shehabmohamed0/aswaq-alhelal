import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/routes/routes.dart';
import 'package:users_presentation/features/auth/bloc/sign_up/complete_form/complete_form_cubit.dart';
import 'package:users_presentation/features/auth/bloc/sign_up/sign_up_form/sign_up_form_cubit.dart';
import 'package:users_presentation/features/auth/pages/landing/landing_page.dart';
import 'package:users_presentation/features/auth/pages/signup/sign_up_page.dart';
import 'package:users_presentation/features/settings/bloc/add_email/add_email_cubit.dart';
import 'package:users_presentation/features/settings/bloc/cubit/update_email_cubit.dart';
import 'package:users_presentation/features/settings/pages/account_info/account_info_page.dart';
import 'package:users_presentation/features/settings/pages/add_email/add_email_page.dart';
import 'package:users_presentation/features/settings/pages/change_phone/change_phone_page.dart';
import 'package:users_presentation/features/settings/pages/contact_info/contact_info_page.dart';
import 'package:users_presentation/features/settings/pages/phone_info/phone_info_page.dart';
import 'package:users_presentation/features/settings/pages/settings/settings_page.dart';
import 'package:users_presentation/features/settings/pages/update_email/update_email_page.dart';

import 'features/currency/presentation/cubit/currency_cubit.dart';
import 'features/currency/presentation/pages/currency_page.dart';
import 'features/distribution_areas/presentation/bloc/distribution_areas_bloc.dart';
import 'features/distribution_areas/presentation/pages/distribution_areas_page.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/instutution_items/presentation/bloc/bloc/add_item_bloc.dart';
import 'features/instutution_items/presentation/cubit/institution_items/instutution_items_cubit.dart';
import 'features/instutution_items/presentation/pages/add_item/add_items_page.dart';
import 'features/instutution_items/presentation/pages/institution_items/institution_items_page.dart';
import 'features/splash/splash_screen.dart';
import 'features/user_institutions/domain/entities/institution.dart';
import 'features/user_institutions/presentation/cubit/add_institution/add_institution_cubit.dart';
import 'features/user_institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart';
import 'features/user_institutions/presentation/pages/add_institution/add_institution_page.dart';
import 'features/user_institutions/presentation/pages/institution/institution_page.dart';
import 'features/user_institutions/presentation/pages/institution/owner_institution.dart';
import 'features/user_institutions/presentation/pages/institutions/institutions_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashPage:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => const SplashScreen(),
        );
      case Routes.landingPage:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => const LandingPage(
            homePage: HomePage(),
          ),
        );
      case Routes.signup:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<SignUpFormCubit>(
                create: (_) => locator(),
              ),
              BlocProvider<CompleteFormCubit>(
                create: (_) => locator(),
              ),
            ],
            child: const SignUpPage(),
          ),
        );

      case Routes.settings:
        return _getPageRoute(
            arguments: settings.arguments,
            routeName: settings.name,
            builder: (context) => const SettingsPage());
      case Routes.accountInfo:
        return _getPageRoute(
            arguments: settings.arguments,
            routeName: settings.name,
            builder: (context) => const AccountInfoPage());
      case Routes.phoneInfo:
        return _getPageRoute(
            arguments: settings.arguments,
            routeName: settings.name,
            builder: (context) => const PhoneInfoPage());
      case Routes.updatePhone:
        return _getPageRoute(
            arguments: settings.arguments,
            routeName: settings.name,
            builder: (context) => const ChangePhonePage());

      case Routes.addEmail:
        return _getPageRoute(
            arguments: settings.arguments,
            routeName: settings.name,
            builder: (context) => BlocProvider<LinkEmailAndPasswordCubit>(
                  create: (context) => locator(),
                  child: const LinkEmailAndPasswordPage(),
                ));
      case Routes.contactInfo:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => const ContactInfoPage(),
        );
      case Routes.updateEmail:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => BlocProvider<UpdateEmailCubit>(
            create: (context) => locator(),
            child: const UpdateEmailPage(),
          ),
        );
      case Routes.currency:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => BlocProvider<CurrencyCubit>(
            create: (context) => locator(),
            child: const CurrencyPage(),
          ),
        );
      // case Routes.addresses:
      //   return _getPageRoute(
      //     arguments: settings.arguments,
      //     routeName: settings.name,
      //     builder: (context) => BlocProvider<AddressesCubit>(
      //       create: (context) => locator()..getAddresses(),
      //       child: const AddressesPage(),
      //     ),
      //   );
      // case Routes.addAddresses:
      //   return _getPageRoute(
      //     arguments: settings.arguments,
      //     routeName: settings.name,
      //     builder: (context) => BlocProvider<UserAddressCubit>(
      //       create: (context) => locator(),
      //       child: AddEditAddressPage(
      //         onAddSuccess: (a) {},
      //         onEditSuccess: (e) {},
      //       ),
      //     ),
      //   );
      // case Routes.selectLocationMap:
      //   final geoPoint = settings.arguments as GeoPoint?;
      //   return _getPageRoute(
      //     routeName: settings.name,
      //     arguments: geoPoint,
      //     builder: (context) => BlocProvider<SelectLocationMapBloc>(
      //       create: (context) {
      //         if (geoPoint != null) {
      //           return locator()..add(InitLocation(geoPoint));
      //         } else {
      //           return locator();
      //         }
      //       },
      //       child: const SelectLocationMapPage(),
      //     ),
      //   );
      case Routes.institutions:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => BlocProvider<UserInstitutionsCubit>(
            create: (context) => locator()..getInstitutions(),
            child: const UserInstitutionsPage(),
          ),
        );
      case Routes.ownerInstitution:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => const OwnerInstitution(),
        );
      case Routes.addInstitution:
        return _getPageRoute(
          routeName: settings.name,
          builder: (context) => BlocProvider<AddInstitutionCubit>(
            create: (context) => locator(),
            child: const AddInstitutionPage(),
          ),
        );
      case Routes.institution:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => const InstitutionPage(),
        );
      case Routes.institutionItems:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<InstitutionItemsCubit>(
                create: (context) => locator()
                  ..getInstitutionsItems(
                      (settings.arguments as Institution).id),
              ),
            ],
            child: const InstitutionItemsPage(),
          ),
        );
      case Routes.addItem:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => BlocProvider<AddItemBloc>(
            create: (context) => locator(),
            child: const AddItemPage(),
          ),
        );
      case Routes.distributionAreas:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => BlocProvider<DistributionAreasBloc>(
            create: (context) => locator()
              ..add(
                LoadDistributionAreas((settings.arguments as Institution).id),
              ),
            child: const DistributionAreasPage(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text('Route not found'),
            ),
          ),
        );
    }
  }
}

PageRoute _getPageRoute({
  required String? routeName,
  required Widget Function(BuildContext) builder,
  RouteSettings? routeSettings,
  Object? arguments,
}) {
  return MaterialPageRoute(
    builder: builder,
    settings:
        routeSettings ?? RouteSettings(name: routeName, arguments: arguments),
  );
}
