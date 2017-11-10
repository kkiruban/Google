@google @product
Feature:
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to product tab in saleforce application
    And I wait for 5 seconds

  @US-003900 @or-product @om-product @so-product
  Scenario: US-003900 to create NEW product associate a Pricebook with the product
    When I follow on "New" button
    And I wait for 5 seconds
    And I enter product name as "smoke-test-product-"
#    And I enter product code as "1001"
    And I check active check box
    And I click on "Save" button from top row
    Then I should see content "Standard Price"
    When I click on add button under standard price section
    And I enter us dollar standard price as "100"
    And I enter gbp british pound standard price as "100"
    And I enter eur standard price as "100"
    And I enter japanese yen standard price as "100"
    And I click on Save button from bottom row