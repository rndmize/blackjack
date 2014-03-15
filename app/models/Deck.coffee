class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    @shuffle()

  shuffle: ->
    @add _(_.range(0, 52)).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealCard: (flip) ->
    console.log 'deal card'
    if @length == 0 then @shuffle()
    return if flip then @pop().flip() else @pop();

  dealPlayer: -> hand = new Hand [ @dealCard(), @dealCard() ], @

  dealDealer: -> new Hand [ @dealCard(true), @dealCard() ], @, true
