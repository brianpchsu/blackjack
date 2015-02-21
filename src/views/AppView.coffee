class window.AppView extends Backbone.View
  template: _.template '
      <button class="hit-button game-button">Hit</button>
      <button class="stand-button game-button">Stand</button>
      <button class="restart">Restart</button>
      <div class="player-hand-container"></div>
      <div class="dealer-hand-container"></div>
      <div class="player-win">You won!</div>
      <div class="dealer-win">Dealer won!</div>
      <div class="tie-win"> Tie</div>
    '
  # showButton: ->
  #   if @model.get('gameOver') then 'inline-block' else 'none'

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .restart': -> @restart()


  initialize: ->
    # @model.get('playerHand').on('busted', ->
    #   $('.game-status').text('you losttttt!'))
    @model.on('change:winner', @endOfGame, this)

    @render()
    @$('.restart').hide()
    @$('.player-win').hide()
    @$('.dealer-win').hide()
    @$('.tie-win').hide()

  showRestart: ->
    $('.restart').show()
    $('.game-button').hide()


  endOfGame: ->
    @showRestart()
    winner = @model.get('winner')
    console.log(winner)
    $('.' + winner + '-win').show()

  restart: ->
    @model.initialize()
    @initialize()

  # getBestScore: (target)->
  #   finalScores = @model.get(target).scores()
  #   if finalScores[1] <= 21 then finalScores[1] else finalScores[0]


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

