import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/color_const.dart';
import '../../../../core/custom/custom.dart';
import '../../../../core/networkChecker/internet_builder.dart';
import '../../../core/const/app_const.dart';
import '../../../core/utils/custom_utils.dart';
import '../presentor/home_riverpod.dart';
import 'widgets/character_card.dart';

const List<String> tabs = [
  'Action',
  'Crime',
  'Sports',
  'Comedy',
  'Suspense',
  'Supernatural',
  'Adventure',
];

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    // initialize();
  }

  Future<void> initialize() async {
    await ref.read(homeProvider.notifier).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final homeData = ref.watch(homeProvider);
    ref.listen(
      homeProvider,
      (previous, next) {
        if (next.status == ApiStatus.error) {
          showCustomSnackBar(
            message: next.errorMessage,
          );
        }
      },
    );
    return Scaffold(
      backgroundColor: ColorsConst.black90,
      body: SafeArea(
        child: InternetBuilder(
          noInternetWidget: const CustomNoInternetWidget(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: SizedBox(
                  height: 40.0,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: tabs.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 15.0,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => ref.read(homeProvider.notifier).updateActiveTab(index),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tabs[index],
                              style: const TextStyle(
                                fontSize: 13.0,
                                color: ColorsConst.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Visibility(
                              visible: homeData.activeTab == index,
                              child: Container(
                                color: ColorsConst.purple,
                                height: 2.0,
                                width: 30.0,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Consumer(
                  builder: (context, ref, _) {
                    final getCharacters = ref.watch(getCharactersProvider);
                    return getCharacters.when(
                      data: (data) {
                        return ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20.0,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          itemCount: homeData.allCharacters?.length ?? 0,
                          itemBuilder: (context, index) => CharacterCard(
                            character: homeData.allCharacters![index],
                          ),
                        );
                      },
                      error: (error, stackTrace) => const Center(
                        child: Text(
                          'Error',
                          style: TextStyle(
                            color: ColorsConst.white,
                          ),
                        ),
                      ),
                      loading: () => const CustomLoader(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
