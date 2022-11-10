import 'package:flutter/material.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/routes/routes.dart';

import '../../../../l10n/l10n.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../../../auth/presentation/bloc/app_status/app_bloc.dart';
import '../../../owner_institutions/presentation/widgets/institution_widget.dart';
import '../../../widgets/check_internet_connection_widget.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/no_data_widget.dart';
import '../cubit/institutions_cubit.dart';

class InstitutionsSliverWidget extends StatelessWidget {
  const InstitutionsSliverWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProfile = context.read<AppBloc>().state.profile as UserProfile;
    return BlocBuilder<InstitutionsCubit, InstitutionsState>(
      builder: (context, state) {
        return state.map(
          initial: (initial) => const SliverToBoxAdapter(
            child: SizedBox(
              height: 1,
            ),
          ),
          loading: (loading) {
            return const SliverFillRemaining(
              child: LoadingWidget(),
            );
          },
          loaded: (state) {
            if (state.institutions.isEmpty) {
              return SliverFillRemaining(
                child: Center(
                    child: NoDataWidget(
                        message: AppLocalizations.of(context)
                            .thereIsNoAvailableInstitutionninYourAddress)),
              );
            }
            return SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                    (context, index) => ShowUpAnimation(
                          goesUp: false,
                          delay: index * 200,
                          child: InstitutionWidget(
                            institution: state.institutions[0],
                            isUserInstitution:
                                userProfile.id == state.institutions[0].id,
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.clientInstitution,
                                  arguments: state.institutions[index]);
                            },
                          ),
                        ),
                    childCount: state.institutions.length),
              ),
            );
          },
          error: (error) => SliverToBoxAdapter(
            child: CheckInternetConnection(onPressed: () {}),
          ),
        );
      },
    );
  }
}

class ShowUpAnimation extends StatefulWidget {
  final Widget child;
  final int? delay;
  final Duration? duration;
  final bool goesUp;

  const ShowUpAnimation(
      {super.key,
      required this.child,
      this.delay,
      required this.goesUp,
      this.duration = const Duration(milliseconds: 1000)});

  @override
  State<ShowUpAnimation> createState() => _ShowUpAnimationState();
}

class _ShowUpAnimationState extends State<ShowUpAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;
  bool _animated = false;
  static bool _isFirst = true;
  @override
  void initState() {
    _animController =
        AnimationController(vsync: this, duration: widget.duration);

    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);

    _animOffset = Tween<Offset>(
      begin: Offset(0.0, widget.goesUp ? 15 : -15),
      end: Offset.zero,
    ).animate(curve);

    if (_isFirst) {
      if (widget.delay != null) {
        Future.delayed(Duration(milliseconds: widget.delay!), () {
          _animated = true;
          _animController.forward();
          _isFirst = false;
        });
      } else {
        _animated = true;
        _isFirst = false;
        _animController.forward();
      }
    } else {
      _animController.value = 1;
    }
    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ShowUpAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animController,
        child: widget.child,
        builder: (context, child) {
          return Opacity(
            opacity: _animController.value,
            child: Transform.translate(
              offset: _animOffset.value,
              child: child!,
            ),
          );
        });
  }
}
