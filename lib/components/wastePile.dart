import 'package:cs_4750_lab1/components/card.dart';
import 'package:cs_4750_lab1/klondike.dart';
import 'package:flame/components.dart';

class Wastepile extends PositionComponent {
  Wastepile({super.position}) : super(size: Klondike.cardSize);

  final List<Card> _cards = [];
  final Vector2 _fanOffset = Vector2(Klondike.cardWidth * 0.2, 0);

  void acquireCard(Card card) {
    assert(card.isFaceUp);
    card.position = position;
    card.priority = _cards.length;
    _cards.add(card);
    _fanOutTopCards();
  }

  void _fanOutTopCards() {
    final n = _cards.length;
    for (var i = 0; i < n; i++) {
      _cards[i].position = position;
    }
    if (n == 2) {
      _cards[i].position.add(_fanOffset);
    } else if (n >= 3) {
      _cards[n - 2].position.add(_fanOffset);
      _cards[n - 1].position.addScaled(_fanOffset, 2);
    }
  }
}