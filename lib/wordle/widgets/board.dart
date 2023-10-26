import 'package:flutter/material.dart';
import 'package:wordle_clone/wordle/wordle.dart';
import 'package:flip_card/flip_card.dart';

class Board extends StatelessWidget {
  const Board({super.key, required this.board, required this.flipCardKeys});

  final List<List<GlobalKey<FlipCardState>>> flipCardKeys;

  final List<Word> board;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: board
          .asMap()
          .map(
            (i, word) => MapEntry(
              i,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: word.letters
                    .asMap()
                    .map((j, letter) => MapEntry(
                          j,
                          FlipCard(
                              key: flipCardKeys[i][j],
                              flipOnTouch: false,
                              direction: FlipDirection.VERTICAL,
                              front: BoardTile(
                                letter: Letter(
                                    val: letter.val,
                                    status: LetterStatus.initial),
                              ),
                              back: BoardTile(letter: letter)),
                        ))
                    .values
                    .toList(),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
