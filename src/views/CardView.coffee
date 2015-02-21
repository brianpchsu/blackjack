class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    console.dir(@template)
    # @$el.html @template @model.attributes
    @$el.css("background-image", "url('img/cards/" + @model.get("rankName") + "-" + @model.get("suitName") + ".png')")
    @$el.addClass 'covered' unless @model.get 'revealed'

