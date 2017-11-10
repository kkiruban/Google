@google-opportunity
Feature:
  In order to test Quote module
  As a tester
  And I should verify all functionalities as per client requirement

  @US-003783 @all-users-quote
  Scenario: US-003783 Update picklist for Google specific currencies on Local Currency field on New Quote
   Given I should navigate to "Opportunities" tab in saleforce application
    Then I should see the following:
      """
      Opportunities
      Home
      """
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    When I click on quote number under quote section
    And I double click on local curreny code
    Then I should verify local currency code picklist values