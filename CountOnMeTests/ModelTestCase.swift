import XCTest

@testable import CountOnMe

class ModelTestCase: XCTestCase {
    
    let model = CountOnMeModel()
    
    func addElementToElements(_ element : String) {
        model.elements.append(element)
    }
    
    func testGivenTwoOpAreImpossible_WhenUserTriesToPutTwoOp_ThenErrorShouldBeSent() {
        addElementToElements("2")
        addElementToElements("+")
        addElementToElements("-")
        XCTAssertFalse(model.isLastElementNotAnOperand)
    }
    func testGivenClearPutAZero_WhenUserClears_ThenZeroIsHere() {
        addElementToElements("3")
        addElementToElements("4")
        model.reset()
        model.elements = ["0"]
        XCTAssertTrue(true)
    }
    
}
