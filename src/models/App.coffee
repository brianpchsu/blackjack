# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    dealerHand = deck.dealDealer()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', dealerHand
    @set 'gameOver', false

    @get('playerHand').on('stand', =>
      dealerHand.at(0).flip()
      while dealerHand.minScore() < 17 then dealerHand.hit()
      @set 'gameOver', true
      )

    @get('playerHand').on('busted', =>
      @set 'gameOver', true
      )




