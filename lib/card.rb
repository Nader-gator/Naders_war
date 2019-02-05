class Card
  SUIT_STRINGS = {
    clubs: '♣',
    diamonds: '♦',
    hearts: '♥',
    spades: '♠'
  }

  VALUE_STRINGS = {
    deuce: '2',
    three: '3',
    four: '4',
    five: '5',
    six: '6',
    seven: '7',
    eight: '8',
    nine: '9',
    ten: '10',
    jack: 'J',
    queen: 'Q',
    king: 'K',
    ace: 'A'
  }


  POINTS = 
  {
    deuce: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
    ten: 10,
    jack: 11,
    queen: 12,
    king: 13,
    ace: 14
  }

  # Returns an array of all suits.
  def self.suits
    SUIT_STRINGS.keys
  end

  # Returns an array of all values.
  def self.values
    VALUE_STRINGS.keys
  end
  


  attr_reader :suit, :value

  def initialize(suit, value)
    unless Card.suits.include?(suit) && Card.values.include?(value)
      fail "illegal suit (#{suit}) or value (#{value})"
    end

    @suit, @value = suit, value
  end

  def point
    POINTS[self.value]
  end

  # Compares two cards to see if they're equal in suit & value.
  def ==(other)
    return false if other.nil?

    [:suit, :value].all? do |attr|
      send(attr) == other.send(attr)
    end
  end

  def to_s
    VALUE_STRINGS[value] + SUIT_STRINGS[suit]
  end

  def inspect
    VALUE_STRINGS[value] + SUIT_STRINGS[suit]
  end
end