import 'package:flutter/material.dart';

import '../../../../core/const/color_const.dart';
import '../../data/model/character_model.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel character;
  CharacterCard({
    required this.character,
    super.key,
  });

  final ValueNotifier<bool> isLiked = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: NetworkImage(
              character.images.first,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              colors: [
                ColorsConst.purple.withOpacity(0.35),
                ColorsConst.black90.withOpacity(0.5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                character.name,
                style: const TextStyle(
                  color: ColorsConst.white,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: ColorsConst.gold,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    '4.5',
                    style: TextStyle(
                      color: ColorsConst.white,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Icon(
                    Icons.remove_red_eye_outlined,
                    color: ColorsConst.white,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    '15k',
                    style: TextStyle(
                      color: ColorsConst.white,
                    ),
                  ),
                  const Spacer(),
                  ValueListenableBuilder(
                    valueListenable: isLiked,
                    builder: (context, value, _) {
                      return InkWell(
                        onTap: () {
                          isLiked.value = !value;
                        },
                        child: Icon(
                          value
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: value
                              ? ColorsConst.warningRed
                              : ColorsConst.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
