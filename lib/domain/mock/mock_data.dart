final testCharacters = [
  ...characters,
  ...characters,
  ...characters,
  ...characters,
];

class Character {
  Character({
    // this.avatar,
    this.title,
    this.description,
    this.color,
  });
  // final String? avatar;
  final String? title;
  final String? description;
  final int? color;
}

//source: https://www.giantbomb.com/dragon-ball-z/3025-159/characters/
final characters = <Character>[
  Character(
    title: 'GOKU',
    description:
        'Goku is the main protagonist in the Dragon Ball franchise and one of the strongest fighters in the universe. He is a Saiyan warrior whose original name was Kakarot, son of Bardock. He is the husband of Chi Chi, and the father of Gohan and Goten. He is also Grandfather to Pan.',
    // avatar: 'assets/goku.png',
    color: 0xFFE83835,
  ),
  Character(
    title: 'VEGETA',
    description:
        'The Prince of all Saiyans, Vegeta is an incredibly strong elite Saiyan warrior. In his constant struggle to surpass his eternal rival Goku, he has become one of the most powerful fighters in the universe.',
    // avatar: 'assets/vegeta.png',
    color: 0xFF238BD0,
  ),
  Character(
    title: 'GOHAN',
    description:
        "Gohan is Goku's son and one of the heroes in the Dragon Ball Z universe. He is also the protagonist of the Cell Saga, where he is the first to reach the Super Saiyan 2 form, through immense anger and emotion. In his later Ultimate form, he is considered the most powerful warrior in Dragon Ball Z. He is Goten's older brother and the father of Pan. His wife is Videl and his grandfathers are Ox-king and Bardock, respectively.",
    // avatar: 'assets/gohan.png',
    color: 0xFF354C6C,
  ),
  Character(
    title: 'FRIEZA',
    description: 'In the Dragon Ball Z universe, Frieza is one of the first villains to really test Goku.',
    // avatar: 'assets/frieza.png',
    color: 0xFF6F2B62,
  ),
  Character(
    title: 'CELL',
    description:
        'Cell is an android constructed from cells taken from various fighters of the Dragon Ball Z universe. He is the main antagonist of the Android Saga of Dragon Ball.',
    // avatar: 'assets/cell.png',
    color: 0xFF447C12,
  ),
  Character(
    title: 'Majin Buu',
    description:
        "One of Dragon Ball Z's most ferocious and transformation-happy of characters, Majin Buu is the last major enemy in the Dragon Ball Z storyline. With the ability to absorb foes, learn moves, and deliver a serious punch, Majin Buu is one of Goku and friends' most challenging of enemies.",
    // avatar: 'assets/boo.png',
    color: 0xFFE7668E,
  ),
  Character(
    title: 'BROLY',
    description:
        "The Legendary Super Saiyan from myth, Broly is one of the Dragon Ball Z franchise's most powerful and destructive Saiyan villains.",
    // avatar: 'assets/broly.png',
    color: 0xFFBD9158,
  ),
];
