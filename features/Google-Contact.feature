@google @Contact
Feature:
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to contacts tab in saleforce application
    When I follow on "New" button

    @US-003785 @US-003952
    Scenario: US-003785 US-003952 Add Partner to Type picklist on Contact Record
    Then I should see "Type" field with read and write permission for all users
    And I should see "Role" field with read and write permission for all users
    And I should see Type picklist values under create new contact page
    And I should see Role picklist values under create new contact page
    When I enter all mandantory fields to create a new random contact
    And I click on "Save" button from top row