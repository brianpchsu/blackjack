# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    dealerHand = deck.dealDealer()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', dealerHand
    @set 'winner', null

    app = this

    @get('playerHand').on('stand', =>
      dealerHand.at(0).flip()
      while dealerHand.minScore() < 17 then dealerHand.hit()
      app.endOfGame()
      )

    @get('playerHand').on('busted', =>
      console.log("busted here")
      app.endOfGame()
      )


  getBestScore: (target)->
    finalScores = @get(target).scores()
    if finalScores[1] <= 21 then finalScores[1] else finalScores[0]

  endOfGame: ->
    playerScore = @getBestScore('playerHand')
    dealerScore = @getBestScore('dealerHand')
    if playerScore > 21 || (dealerScore < 22 && dealerScore > playerScore)
      @set 'winner', 'dealer'
    else if playerScore == dealerScore
      @set 'winner', 'tie'
    else
      @set 'winner', 'player'




