assert = chai.assert

# there is player's deck
# there is dealer's deck
# there are two cards for

describe 'AppView', ->
  app = null
  appView = null


  beforeEach ->
    app = new App()
    appView = new AppView({ model: app })

  describe 'HandView setup', ->
    it 'should have two instances of HandView', ->
      console.log(this)
      playerContainer = appView.$el.find('.player-hand-container')
      assert.isTrue playerContainer.length > 0

      dealerContainer = appView.$el.find('.dealer-hand-container')
      assert.isTrue dealerContainer.length > 0

  describe 'Hit button adds card to player hand', ->

    it 'should add card to player hand', ->
      # set up a spy
      spyprogram = sinon.spy(appView.model.get('playerHand'), 'hit')
      # simulate the click
      appView.$el.find('.hit-button').click()
      sinon.assert.called(spyprogram)

  # it 'should give each player two cards', ->


