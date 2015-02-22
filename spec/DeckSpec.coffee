assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  describe 'shuffle', ->
    it 'should shuffle everytime we initiate a game', ->
      deck2 = new Deck()
      compareEach = (deck, deck2) ->
        deck.some((card, index) ->
          otherCard = deck2.at index
          result = card.get('value') != otherCard.get('value') or card.get('suit') != otherCard.get('suit')
          )
      assert.strictEqual compareEach(deck, deck2), true

  describe 'create the right cards', ->
    it 'should check there are 13 cards each suit', ->
      suitName: ['Spades', 'Diamonds', 'Clubs', 'Hearts']


