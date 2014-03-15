#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', new Deck()
    @set 'score', 300
    @set 'betSize', 10
    @set 'inputBetSize', 10
    @newRound()

  newRound: ->
    @setBetSize()
    @set 'playerHand', (@get 'deck').dealPlayer()
    @set 'dealerHand', (@get 'deck').dealDealer()
    (@get 'playerHand').on 'stand bust', @dealerPlay, @
    console.log 'new hand trggering'
    @trigger 'newRound'

  dealerPlay: ->
    console.log 'dealer play'
    while (scores = ( (dealer = @get 'dealerHand').scores yes )[0]) < 17 and not (scores[1]? and 17 < scores[1] <= 21)
      dealer.hit()
    console.log 'call new round'
    @endRound()

  endRound: ->
    win = (@get 'playerHand').fullScore() > (@get 'dealerHand').fullScore()
    @set 'score', (if win then (@get 'score') + (@get 'betSize') else (@get 'score') - (@get 'betSize'))
    alert 'You ' + (if win then 'won ' else 'suck ') + '\nYou had ' + ((@get 'playerHand').fullScore() or 'bust') + '\nDealer had ' + ((@get 'dealerHand').fullScore() or 'bust')
    @newRound()

  changeBetSize: (direction)->
    @set 'inputBetSize', ((@get 'inputBetSize') + 10 * direction)
    console.log @get 'inputBetSize', @

  setBetSize: ->
    @set 'betSize', (Math.min (Math.max 10, (@get 'inputBetSize')), @get 'score')

