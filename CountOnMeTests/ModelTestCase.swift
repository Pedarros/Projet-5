import XCTest

@testable import CountOnMe

class ModelTestCase: XCTestCase {
    
    // Allows the use of methods of the model
    let model = CountOnMeModel()
    override func setUp() {
        super.setUp()
    }
    // Allows to append elements
    func addElementToElements(_ element : String) {
        model.elements.append(element)
    }
    
    // Checks if an error is sent when two ops are together
    func testGivenTwoOpAreImpossible_WhenUserTriesToPutTwoOp_ThenErrorShouldBeSent() {
        addElementToElements("2")
        addElementToElements("+")
        addElementToElements("-")
        
        XCTAssertFalse(model.isLastElementNotAnOperand)
    }
    
    // checks if 0 is printed when clear button is pressed
    func testGivenClearPutAZero_WhenUserClears_ThenZeroIsHere() {
        addElementToElements("3")
        addElementToElements("4")
        model.reset()
        
        XCTAssert(model.results == "0")
    }
    
    // Check if Addition is performed
    func testGivenAddition_WhenAdditionIsTapped_ThenAdditionShouldBePerformed() {
        addElementToElements("5")
        addElementToElements(" + ")
        addElementToElements("5")
        model.performOperations()
        
        XCTAssertTrue(model.results == "5 + 5 = 10")
    }
    
    // Check if Substraction is performed

    func testGivenSubstraction_WhenSubstractionIsTapped_ThenSubstractionShouldBePerformed() {
        addElementToElements("6")
        addElementToElements(" - ")
        addElementToElements("2")
        model.performOperations()
        
        XCTAssertTrue(model.results == "6 - 2 = 4")
    }
    
    // Check if 0 is first and if it is removed
    func testGivenZeroCanNotBeFirst_WhenThereIsAZeroInFirstPosition_ThenTheZeroIsRemove() {
        addElementToElements("0")
        addElementToElements("2")
        
        
        XCTAssert(model.results == "2")
    }
    
    // Check if Multiplication is performed
    func testGivenMultiplication_WhenMultiplyIsTapped_ThenMultiplyShouldBePerformed() {
        addElementToElements("4")
        addElementToElements(" × ")
        addElementToElements("2")
        model.performOperations()
        
        XCTAssertTrue(model.results == "4 × 2 = 8")
    }
    
    // Check if Division is performed

    func testGivenDivide_WhenDivideIsTapped_ThenDivideShouldBePerformed() {
        addElementToElements("8")
        addElementToElements(" ÷ ")
        addElementToElements("2")
        model.performOperations()
        
        XCTAssertTrue(model.results == "8 ÷ 2 = 4")
    }
    func testGivenTwentySix_WhenTwoAndSixAreTapped_ThenTwentySixShouldBeDisplayed() {
        addElementToElements("2")
        addElementToElements("6")
        
        XCTAssert(model.results == "26")
    }
    func testGivenNegativeResult_WhenGreaterNumberSubstratTheOther_ThenNegativeResultShouldHappened() {
        addElementToElements("3")
        addElementToElements(" - ")
        addElementToElements("5")
        
        model.performOperations()
        
        XCTAssertTrue(model.results == "3 - 5 = -2")
    }
    
    // Check if the app is performing the calcul according to the priority rules
    func testGivenPriorityOp_WhenThereIsSeveralOp_ThenTheCalculationHasToBeWithPriority() {
        addElementToElements("5")
        addElementToElements(" + ")
        addElementToElements("5")
        addElementToElements("3")
        addElementToElements(" - ")
        addElementToElements("5")
        addElementToElements(" ÷ ")
        addElementToElements("2")
        addElementToElements(" - ")
        addElementToElements("2")
        
        model.performOperations()
        
        XCTAssert(model.results == "5 + 53 - 5 ÷ 2 - 2 = 53,5")
        
    }
    
}
