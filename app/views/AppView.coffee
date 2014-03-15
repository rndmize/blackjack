class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div>
      <span>Chips left: <%= score %>, betting at: <%= betSize %></span>
    </div>
    <div>
      <button class="decreaseBetSize">Less</button>
      <label> <%= inputBetSize %> </label>
      <button class="increaseBetSize">More</button>
    </div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': ->
      console.log 'click hit button'
      @model.get('playerHand').hit()

    'click .stand-button': ->
      console.log 'stand button clicked'
      @model.get('playerHand').stand()

    'click .increaseBetSize': ->
      @model.changeBetSize(1)

    'click .decreaseBetSize': ->
      @model.changeBetSize(-1)

# up 38 down 40
  initialize: ->
    @render()
    @model.on 'newRound change', (->
      console.log 'app view render'
      @render()), @

    ($ document.body).on 'keydown', ((e)=>
      console.log e
      if e.keyCode == 38 then @model.get('playerHand').hit() else if e.keyCode == 40 then @model.get('playerHand').stand() )

  render: ->
    @$el.children().detach()
    @$el.html (@template @model.attributes)
    console.log @model.get 'playerHand', @model.attributes;
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
