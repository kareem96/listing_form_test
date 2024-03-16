import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_listing_test/core/routes/router_import.gr.dart';
import 'package:form_listing_test/core/utils/theme/colors.dart';
import 'package:form_listing_test/presentation/provider/page_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import '../core/utils/assets.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [HomeRoute(), AboutRoute()],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Consumer<PageProvider>(builder: (context, provider, _) {
          return Scaffold(
            body: child,
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                backgroundColor: AppColors.colorRed,
                currentIndex: tabsRouter.activeIndex,
                selectedItemColor: AppColors.colorBlack,
                unselectedItemColor: AppColors.colorGreyInactive,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  if (index == 0) {
                    context.router.replace(const HomeRoute());
                  }
                  provider.changeIndex(index);
                  tabsRouter.setActiveIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icHome,
                      colorFilter: ColorFilter.mode(
                        provider.selectedIndex == 0 ? AppColors.colorBlack : AppColors.colorGreyInactive,
                        BlendMode.srcATop,
                      ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      Assets.icCircle,
                      colorFilter: ColorFilter.mode(
                        provider.selectedIndex == 1 ? AppColors.colorBlack : AppColors.colorGreyInactive,
                        BlendMode.srcATop,
                      ),
                    ),
                    label: 'About',
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
