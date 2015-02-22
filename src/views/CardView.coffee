class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    console.dir(@template)
    # @$el.html @template @model.attributes
    rankName = @model.get 'rankName'
    suitName = @model.get 'suitName'
    imageName = "url('img/cards/#{rankName}-#{suitName}.png')"
    @$el.css("background-image", imageName) if @model.get 'revealed'
    # @$el.css("background-image", "url('img/cards/" + @model.get("rankName") + "-" + @model.get("suitName") + ".png')") if @model.get 'revealed'
    @$el.css("background-image", "url('img/card-back.png')") if !@model.get 'revealed'
    # @$el.addClass 'covered' unless @model.get 'revealed'

