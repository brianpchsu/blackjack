class window.AppView extends Backbone.View
  template: _.template '
      <button class="hit-button game-button">Hit</button>
      <button class="stand-button game-button">Stand</button>
      <button class="restart">Restart</button>
      <div class="game-status"></div>
      <div class="player-hand-container"></div>
      <div class="dealer-hand-container"></div>
    '
  showButton: ->
    if @model.get('gameOver') then 'inline-block' else 'none'


  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @model.get('playerHand').on('busted', ->
      $('.game-status').text('you losttttt!'))
    @model.on('change:gameOver', @showRestart)

    @render()
    @$('.restart').hide()

  showRestart: ->
    $('.restart').show()
    $('.game-button').hide()


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

