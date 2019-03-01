import Foundation

class Set {
    private var allCards = [Card]()
    
    init(){
        initializeAllCards()
    }

    // Initialize all the cards in all combinations of the enum structure
    func initializeAllCards() {
        // .allCases concept taken from
        // https://oleb.net/blog/2018/06/enumerating-enum-cases/
        for numberOfShapes in CardNumShapes.allCases {
            for shape in CardShape.allCases {
                for color in CardColor.allCases {
                    for shading in CardShade.allCases {
                        allCards.append(Card.init(numberOfShapes: numberOfShapes, shape: shape, color: color, shading: shading))
                    }
                }
            }
        }
    }
    
    func chooseCard (at index: Int) {
        if !cards[index].isMatched {
            //
            if let matchIndex = indexOfOneandOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                flipCount += 1
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    scoreCount += 1
                }
                else if scoreCount > 0
                {
                    scoreCount -= 1
                }
                
                cards[index].isFaceUp = true
            }
            else if indexOfOneandOnlyFaceUpCard != index {
                cards[index].isFaceUp = true
                indexOfOneandOnlyFaceUpCard = index
                flipCount += 1
            }
        }
    }
    // isSet follows the criteria to determine whether card is a set or not
    func isSet(matchedCards: [Card]) -> Bool {
        
        guard isNumberOfShapesTheSame(matchedCards: matchedCards) || isNumberOfShapesDifferent(matchedCards: matchedCards) else { return false }
        guard isShapeTheSame(matchedCards: matchedCards) || isShapeDifferent(matchedCards: matchedCards) else { return false }
        guard isColorTheSame(matchedCards: matchedCards) || isColorDifferent(matchedCards: matchedCards) else { return false }
        guard isShadingTheSame(matchedCards: matchedCards) || isShadingDifferent(matchedCards: matchedCards) else { return false }
        return true
    }
    
    /*Following are helper functions to determine if the selected cards have different properties*/
    private func isShapeDifferent(matchedCards: [Card]) -> Bool {
        var values = matchedCards
        
        while !values.isEmpty {
            let shape = values.removeFirst().shape
            
            for anotherCard in values {
                if shape == anotherCard.shape { return false }
            }
        }
        return true
    }
    
    private func isColorDifferent(matchedCards: [Card]) -> Bool {
        var values = matchedCards
        
        while !values.isEmpty {
            let color = values.removeFirst().color
            
            for anotherCard in values {
                if color == anotherCard.color { return false }
            }
        }
        return true
    }
    
    private func isNumberOfShapesDifferent(matchedCards: [Card]) -> Bool {
        var values = matchedCards
        
        while !values.isEmpty {
            let num = values.removeFirst().numberOfShapes
            
            for anotherCard in values {
                if num == anotherCard.numberOfShapes { return false }
            }
        }
        return true
    }
    
    private func isShadingDifferent(matchedCards: [Card]) -> Bool {
        var values = matchedCards
        
        while !values.isEmpty {
            let shade = values.removeFirst().shading
            
            for anotherCard in values {
                if shade == anotherCard.shading { return false }
            }
        }
        return true
    }
    
    /*Following are helper functions to determine if the selected cards have same properties*/
    private func isColorTheSame(matchedCards: [Card]) -> Bool {
        return matchedCards[0].color == matchedCards[1].color  && matchedCards[1].color == matchedCards[2].color
    }
    
    private func isNumberOfShapesTheSame(matchedCards: [Card]) -> Bool {
        return matchedCards[0].numberOfShapes == matchedCards[1].numberOfShapes  && matchedCards[1].numberOfShapes == matchedCards[2].numberOfShapes
    }
    
    private func isShadingTheSame(matchedCards: [Card]) -> Bool {
        return matchedCards[0].shading == matchedCards[1].shading  && matchedCards[1].shading == matchedCards[2].shading
    }

    private func isShapeTheSame(matchedCards: [Card]) -> Bool  {
        return matchedCards[0].shape == matchedCards[1].shape && matchedCards[1].shape == matchedCards[2].shape
    }
    
    /*
     This function will deal 3 cards at a time
     upon user's request
     */
    func dealCard(dealtAmount: Int) -> [Card] {
        var count = 0
        var dealtCardArray = [Card]()
        while (count < dealtAmount)
        {
            dealtCardArray.append(allCards.removeLast())
            count += 1
        }
        // Return an array containing last three
        // cards from the deck
        return dealtCardArray
    }
}
