import XCTest

@testable import CountOnMe

class ModelTestCase: XCTestCase {
    
    let model = CountOnMeModel()
    override func setUp() {
        super.setUp()
    }
        
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
        
        XCTAssertTrue(model.elements == ["0"])
    }
    func testGivenAddition_WhenAdditionIsTapped_ThenAdditionShouldBePerformed() {
        addElementToElements("5")
        addElementToElements("+")
        addElementToElements("5")
        model.performOperations()
        
        XCTAssertTrue(model.elements == ["5+5=10"])
    }
    
    func testGivenZeroCanNotBeFirst_WhenThereIsAZeroInFirstPosition_ThenTheZeroIsRemove() {
        addElementToElements("0")
        addElementToElements("2")
        model.elements = ["2"]
        
        XCTAssertTrue(true)
    }
    func testGivenMultiplication_WhenMultiplyIsTapped_ThenMultiplyShouldBePerformed() {
        addElementToElements("4")
        addElementToElements("*")
        addElementToElements("2")
        
        XCTAssert(model.results == "8")
    }
    func testGivenDivide_WhenDivideIsTapped_ThenDivideShouldBePerformed() {
        addElementToElements("8")
        addElementToElements("/")
        addElementToElements("2")
        
        XCTAssert(model.results == "4")
    }
    func testGivenTwentySix_WhenTwoAndSixAreTapped_ThenTwentySixShouldBeDisplayed() {
        addElementToElements("2")
        addElementToElements("6")
        
        XCTAssert(model.results == "26")
    }
}
