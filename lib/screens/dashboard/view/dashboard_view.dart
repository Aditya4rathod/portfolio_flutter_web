import 'package:flutter/material.dart';
import 'package:portfolio/app/app_colors.dart';
import 'package:portfolio/screens/about_me/view/about_me_page.dart';
import 'package:portfolio/screens/design_by/view/design_by_view.dart';
import 'package:portfolio/screens/introduction/view/intro_page.dart';
import 'package:portfolio/screens/my_contact/view/contact_me_view.dart';
import 'package:portfolio/screens/my_expertise/my_expertise_tabview.dart';
import 'package:portfolio/screens/my_projects/view/my_project_view.dart';
import 'package:portfolio/screens/services/view/services_view.dart';
import 'package:scroll_to_id/scroll_to_id.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  ScrollToId? scrollToId;
  final ScrollController scrollController = ScrollController();
  bool _showArrowUp = false; // Track whether to show the "arrow up" icon


  void _scrollListener() {
    setState(() {
      _showArrowUp = scrollController.offset > 0; // Show if scrolled down
    });
    print(scrollToId!.idPosition());
  }

  @override
  void initState() {
    super.initState();

    /// Create ScrollToId instance
    scrollToId = ScrollToId(scrollController: scrollController);

    scrollController.addListener(_scrollListener);
  }


  @override
  void dispose() {
    // Dispose of the scroll controller
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Stack(
        children: [
          InteractiveScrollViewer(
            scrollToId: scrollToId,
            children: <ScrollContent>[
              ScrollContent(
                id: 'IntroPage',
                child: IntroductionPage(),
              ),
              // ScrollContent(id: 'AboutMe', child: AboutMeView()),
              ScrollContent(id: 'MyExpertise', child: const MyExpertiseTabView()),
              ScrollContent(id: 'ServicesByMe', child: ServicesView()),
              ScrollContent(id: 'MyProjects', child: MyProjectView()),
              ScrollContent(id: 'ContactMe', child: ContactMeView()),
              ScrollContent(id: 'designedBy', child: DesignByView()),
            ],
          ),
          Positioned(
            top: 16,
            right: 16,
            child: InkWell(
              onTap: (){
                scrollToId!.animateTo('MyProjects', duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white.withOpacity(0.1),
                child: Icon(
                  Icons.checklist,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          if (_showArrowUp) // Show only if `_showArrowUp` is true
            Positioned(
              bottom: 16,
              right: 16,
              child: InkWell(
                onTap: (){
                  scrollToId!.animateTo('IntroPage', duration: Duration(milliseconds: 1000), curve: Curves.ease);
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white.withOpacity(0.1),
                  child: Icon(
                    Icons.arrow_drop_up,
                    size: 40,
                    color: AppColors.pinkAccentColor,
                  ),
                ),
              ),)
        ],
      ),
    );
  }
}
