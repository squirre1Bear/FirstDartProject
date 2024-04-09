import 'package:my_project/my_project.dart' as my_project;
import 'dart:convert';
import 'dart:io';

import 'package:tic_tac_toe_game/tic_tac_toe_game.dart';

void main() {
  var gameState = TicTacToeGameState();

  while (
      gameState.status == Status.p1Turn || gameState.status == Status.p2Turn) {
    final move = gameState.status == Status.p1Turn ? Player.p1 : Player.p2;
    print('You are up, $move');
    print('Pick a field:');
    print('');

    printFields(gameState.fields);

    try {
      final field = int.parse(stdin.readLineSync(encoding: utf8) ?? '');
      gameState = gameState.claimField(field - 1);
    } catch (e) {
      print('Invalid move, try again.');
    }
  }

  print('Game Over: ${gameState.status}');
}

void printFields(List<Player?> fields) {
  print('${field(fields[0], 1)}|${field(fields[1], 2)}|${field(fields[2], 3)}');
  print('-------');
  print('${field(fields[3], 4)}|${field(fields[4], 5)}|${field(fields[5], 6)}');
  print('-------');
  print('${field(fields[6], 7)}|${field(fields[7], 8)}|${field(fields[8], 9)}');
}

String field(Player? field, int index) {
  if (field == null) return '$index';
  return field == Player.p1 ? 'X' : 'O';
}