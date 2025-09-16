import 'package:cs_4750_lab1/components/card.dart';
import 'package:cs_4750_lab1/components/wastePile.dart';
import 'package:cs_4750_lab1/klondike.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/widgets.dart';

class Stockpile extends PositionComponent with TapCallbacks {
  Stockpile({super.position}) : super(size: Klondike.cardSize);

  final List<Card> _cards = [];

  void acquireCard(Card card) {
    assert(!card.isFaceUp);
    card.position= position;
    card.priority = _cards.length;
    _cards.add(card);
  }

  @override
  void onTapUp(TapUpEvent event) {
    final wastePile = parent!.firstChild<Wastepile>()!;
    for (var i = 0; i < 3; i++) {
      if (_cards.isNotEmpty) {
        final card = _cards.removeLast();
        card.flip();
        wastePile.acquireCard(card);
      }
    }
  }

  final _borderPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..color = const Color(0xFF3F5B5D);
  final _circlePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 100
    ..color = const Color(0x883F5B5D);

  void render(Canvas canvas) {
    canvas.drawRRect(Klondike.cardRRect, _borderPaint);
    canvas.drawCircle(
      Offset(width / 2, height / 2),
      Klondike.cardWidth * 0.3,
      _circlePaint,
    );
  }
}