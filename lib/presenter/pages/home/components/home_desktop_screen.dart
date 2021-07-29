import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviee/infra/dependencies/injection_container.dart';
import 'package:moviee/presenter/pages/home/home_controller.dart';

import 'widgets.dart';

class HomeDesktopScreen extends StatelessWidget {
  final HomeController controller;
  const HomeDesktopScreen(this.controller);

  @override
  Widget build(BuildContext context) {
    final controller = serviceLocator.get<HomeController>();

    return GetBuilder<HomeController>(
      init: controller,
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColorDark,
          body: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SideBarWidget(),
              Expanded(
                child: LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 80.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SearchBarWidget(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.account_circle),
                              ),
                            ],
                          ),
                        ),
                        Obx(() {
                          return GridMoviesWidget(
                            list: controller.moviesList.toList(),
                          );
                        })
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
          bottomNavigationBar: FooterWidget(),
        );
      },
    );
  }
}
