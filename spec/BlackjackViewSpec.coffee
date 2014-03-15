describe 'black jack view', ->

  beforeEach ->
    hand = new Deck().dealPlayer()

  it 'should work', ->
    expect(AppView?).toBe true
