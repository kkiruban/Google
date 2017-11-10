@google @Account
Feature:
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to Accounts tab in saleforce application
    When I follow on "New" button

    @US-003928 @US-003713 @US-004242 @330483 @all-users-account
    Scenario: US-003928 US-003713 US-003951 US-004242 330483 Add fields and picklist values to Account page layout
    Then I should see "Vertical" field with read and write permission for all except salesops user
    And I should see "Client Theatre" field with read and write permission for all except salesops user
    And I should see "Client ID" field with read and write permission for all except salesops user
    And I should see "At Risk Reason" field with read only permission for all users
    And I should see "Desired End Points" field with read only permission for all users
    And I should see "Achieved End Points" field with read only permission for all users
    And I should see "Use Cases" field with read only permission for all users
    And I should see Vertical picklist values under account details section
    And I should see Client Theatre picklist values under account details section
    But I should not see "Achieved API's" field for all users
    And I should not see "Desired API's" field for all users

    @US-003951 @US-004242 @admin-account
    Scenario: US-003951 US-004242 Add fields and picklist values to Account page layout
    Then I should verify At Risk Reason picklist values
    And I should see Achieved APIs multiple picklist under new account page
    And I should verify Achieved APIs multiple picklist values under new account page
    And I should see Desired APIs multiple picklist under new account page
    And I should verify Desired APIs multiple picklist values under new account page
    And I should see Use Cases multiple picklist under new account page
    And I should verify Use Cases multiple picklist values under new account page
    And I should see Achieved End Points multiple picklist under new account page
    And I should verify Achieved End Points multiple picklist values under new account page
    And I should see Desired End Points multiple picklist under new account page
    And I should verify Desired End Points multiple picklist values under new account page
    When I enter account name as "smoke-test-account-"
    And I click on "Save" button from top row
    Then I should see content "Success Plan"