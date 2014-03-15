describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it "should give the last card from the deck", ->
      expect(deck.length).toBe 50
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 49
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 48

  describe 'dealPlayers', ->
    it "should not shuffle when deck has cards left", ->
      expect(deck.length).toBe 50
      hand = deck.dealPlayer()
      expect(deck.length).toBe 48
      hand = deck.dealPlayer()
      expect(deck.length).toBe 46

