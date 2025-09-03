import 'package:cs_4750_lab1/klondike.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

void main() {
  final game = Klondike();
  runApp(GameWidget(game: game));
}