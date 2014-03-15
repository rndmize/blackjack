class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    console.log 'hit', @dealer
    @add(@deck.dealCard())
    if @bust()
    then @trigger 'bust', @
    @last()
  stand: ->
    @trigger 'stand', @

  bust: -> @scores()[0] > 21

  scores: (full = no) ->
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if (card.get 'revealed') or full then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

  fullScore: ->
    Math.max (if (score = @scores(yes))[0] > 21 then 0 else score[0]), (if score[1]? and score[1] <= 21 then score[1] else 0)

