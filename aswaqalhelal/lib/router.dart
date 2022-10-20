import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import 'features/address/domain/entities/address.dart';
import 'features/address/domain/entities/geo_point.dart';
import 'features/address/presentation/bloc/select_location_map/select_location_map_bloc.dart';
import 'features/address/presentation/cubit/add_edit_address/add_edit_address_cubit.dart';
import 'features/address/presentation/cubit/addresses/addresses_cubit.dart';
import 'features/address/presentation/pages/add_edit_address/add_edit_address_page.dart';
import 'features/address/presentation/pages/addresses/addresses_page.dart';
import 'features/address/presentation/pages/select_location_map/select_location_map_page.dart';
import 'features/auth/domain/entities/base_profile.dart';
import 'features/auth/domain/entities/institution_profile.dart';
import 'features/auth/domain/entities/user_profile.dart';
import 'features/auth/presentation/pages/landing/landing_page.dart';
import 'features/cart/presentation/cubit/institution_cart/institution_cart_cubit.dart';
import 'features/client_institutions/presentation/cubit/client_institution/client_institutions_cubit.dart';
import 'features/client_institutions/presentation/pages/client_institution_page.dart';
import 'features/distribution_areas/presentation/bloc/distribution_areas_bloc.dart';
import 'features/distribution_areas/presentation/pages/distribution_areas_page.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/institution_items/presentation/bloc/add_item/add_item_bloc.dart';
import 'features/institution_items/presentation/cubit/institution_items/institution_items_cubit.dart';
import 'features/institution_items/presentation/pages/add_item/add_items_page.dart';
import 'features/institution_items/presentation/pages/institution_items/institution_items_page.dart';
import 'features/institution_receipts/presentation/cubit/institution_receipts_cubit.dart';
import 'features/institution_receipts/presentation/pages/receipt_page.dart';
import 'features/jobs_offers/presentation/cubit/jobs_offers_cubit.dart';
import 'features/jobs_offers/presentation/pages/jobs_offers_page.dart';
import 'features/notifications/presentation/pages/notifications_page.dart';
import 'features/orders/presentation/cubit/cubit/institution_orders_cubit.dart';
import 'features/orders/presentation/cubit/user_orders/user_orders_bloc.dart';
import 'features/orders/presentation/cubit/user_orders/user_orders_event.dart';
import 'features/orders/presentation/pages/institution_orders_page.dart';
import 'features/orders/presentation/pages/user_orders_page.dart';
import 'features/recruitment/presentation/cubit/employees/employees_cubit.dart';
import 'features/recruitment/presentation/cubit/job_offers/send_job_offers_cubit.dart';
import 'features/recruitment/presentation/cubit/recruitment/recruitment_cubit.dart';
import 'features/recruitment/presentation/pages/recruitment/DTOs/recruitment_page_arguments.dart';
import 'features/recruitment/presentation/pages/recruitment/recruitment_page.dart';
import 'features/settings/presentation/bloc/add_email/add_email_cubit.dart';
import 'features/settings/presentation/bloc/cubit/update_email_cubit.dart';
import 'features/settings/presentation/pages/account_info/account_info_page.dart';
import 'features/settings/presentation/pages/add_email/add_email_page.dart';
import 'features/settings/presentation/pages/change_phone/change_phone_page.dart';
import 'features/settings/presentation/pages/contact_info/contact_info_page.dart';
import 'features/settings/presentation/pages/phone_info/phone_info_page.dart';
import 'features/settings/presentation/pages/settings/settings_page.dart';
import 'features/settings/presentation/pages/update_email/update_email_page.dart';
import 'features/start_up/presentation/pages/onboarding_page.dart';
import 'features/start_up/presentation/pages/splash_screen.dart';
import 'features/user_institutions/presentation/cubit/add_institution/add_institution_cubit.dart';
import 'features/user_institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart';
import 'features/user_institutions/presentation/pages/add_institution/add_institution_page.dart';
import 'features/user_institutions/presentation/pages/institution/owner_institution_page.dart';
import 'features/user_institutions/presentation/pages/owner_institutions/owner_institutions_page.dart';
import 'features/work_institutions/presentation/cubit/work_institutions_cubit.dart';
import 'features/work_institutions/presentation/pages/ins_page.dart';
import 'features/work_institutions/presentation/pages/work_institution_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => const SplashScreen(),
        );
      case Routes.onboarding:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => const OnboardingPage(),
        );
      case Routes.landingPage:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => const LandingPage(
            homePage: HomePage(),
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

      case Routes.addresses:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => BlocProvider<AddressesCubit>(
            create: (context) => locator()..getAddresses(),
            child: const AddressesPage(),
          ),
        );
      case Routes.addAddresses:
        final address = settings.arguments as Address?;

        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => BlocProvider<AddEditAddressCubit>(
            create: (context) {
              if (address == null) {
                return locator();
              } else {
                return locator()..initEdit(address);
              }
            },
            child: const AddEditAddressPage(),
          ),
        );
      case Routes.selectLocationMap:
        final geoPoint = settings.arguments as GeoPoint?;
        return _getPageRoute(
          routeName: settings.name,
          arguments: geoPoint,
          builder: (context) => BlocProvider<SelectLocationMapBloc>(
            create: (context) {
              if (geoPoint != null) {
                return locator()..add(InitLocation(geoPoint));
              } else {
                return locator();
              }
            },
            child: const SelectLocationMapPage(),
          ),
        );
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
          builder: (context) => const OwnerInstitutionPage(),
        );
      case Routes.addInstitution:
        final user = settings.arguments as UserProfile;

        return _getPageRoute(
          routeName: settings.name,
          builder: (context) => BlocProvider<AddInstitutionCubit>(
            create: (context) => locator()..initailPhoneNumber(user),
            child: const AddInstitutionPage(),
          ),
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
                      (settings.arguments as InstitutionProfile).id),
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
                LoadDistributionAreas(
                    (settings.arguments as InstitutionProfile).id),
              ),
            child: const DistributionAreasPage(),
          ),
        );
      case Routes.institutionReceipts:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) => BlocProvider<InstitutionReceiptsCubit>(
            create: (context) => locator()
              ..getInstitutionItems(
                  (settings.arguments as InstitutionProfile).id),
            child: const InstitutionReceiptPage(),
          ),
        );
      case Routes.recruitment:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) {
            final arguments = settings.arguments as RecruitmentPageArguments;
            return MultiBlocProvider(providers: [
              BlocProvider<EmployeesCubit>(
                  create: (context) =>
                      locator()..getEmployees(arguments.institutionId)),
              BlocProvider<InstitutionJobsOffersCubit>(
                  create: (context) =>
                      locator()..getSentOffers(arguments.institutionId)),
              BlocProvider<RecruitmentCubit>(create: (context) => locator()),
            ], child: const RecruitmentPage());
          },
        );
      case Routes.jobsOffers:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) {
            final userId = settings.arguments as String;

            return BlocProvider<JobsOffersCubit>(
              create: (context) => locator()..getJobOffers(userId),
              child: const JobsOffersPage(),
            );
          },
        );
      case Routes.workInstitutions:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) {
            final user = settings.arguments as BaseProfile;

            return BlocProvider<WorkInstitutionsCubit>(
              create: (context) => locator()..getInstitutions(user.id),
              child: const WorkInstitutionsPage(),
            );
          },
        );
      case Routes.insPage:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) {
            return const InsPage();
          },
        );
      case Routes.notifications:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) {
            return const NotificationsPage();
          },
        );
      case Routes.clientInstitution:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) {
            final institution = settings.arguments as InstitutionProfile;
            return MultiBlocProvider(
              providers: [
                BlocProvider<ClientInstitutionsCubit>(
                  create: (context) => locator()..getItems(institution),
                ),
                BlocProvider<InstitutionCartCubit>(
                  create: (context) => locator(),
                ),
              ],
              child: const ClientInstitutionPage(),
            );
          },
        );
      case Routes.institutionOrders:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) {
            final institution = settings.arguments as InstitutionProfile;

            return MultiBlocProvider(
              providers: [
                BlocProvider<InstitutionOrdersCubit>(
                  create: (context) => locator()..init(institution.id),
                ),
              ],
              child: const InstitutionOrdersPage(),
            );
          },
        );
      case Routes.userOrders:
        return _getPageRoute(
          arguments: settings.arguments,
          routeName: settings.name,
          builder: (context) {
            final userProfile = settings.arguments as UserProfile;

            return MultiBlocProvider(providers: [
              BlocProvider<UserOrdersBloc>(
                create: (context) =>
                    locator()..add(UserOrdersRequested(userProfile.id)),
              ),
            ], child: const UserOrdersPage());
          },
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
