describe 'deck constructor', ->

  it 'should create a card collection', ->
    collection = new Deck()
    expect(collection.length).toBe 52

  it 'should flip and reveal', ->
    card = new Deck().first()
    expect(card.get('revealed')).toBe true
    card.flip()
    expect(card.get('revealed')).toBe false
    card.reveal()
    expect(card.get('revealed')).toBe true
