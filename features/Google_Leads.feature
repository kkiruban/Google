@google @leads
Feature:
  In order to test leads functionality
  As a tester
  I should verify all the functionality as per client requirement

  @US-003715 @Allusers_leads
  Scenario: US-003715 Leads page layout removed Company text field and add field for Account Name
    Given I should navigate to Accounts tab in saleforce application
    And I wait for 15 seconds
    When I follow on "New" button
    And I wait for 15 seconds
    And I enter account name as "smoke-test-account-"
    And I click on "Save" button from top row
    And I wait for 15 seconds
    Then I should see content "Flex Leads"
    When I click on new lead button under flex leads
    Then I should see content "Lead Edit"
    And I should see account name field with read write permisssion

  @US-003717 @Allusers_leads
  Scenario: US-003717 Leads page layout made Email field as required
    Given I should navigate to Accounts tab in saleforce application
    And I wait for 15 seconds
    When I follow on "New" button
    And I wait for 15 seconds
    And I enter account name as "smoke-test-account-"
    And I click on "Save" button from top row
    And I wait for 15 seconds
    Then I should see content "Flex Leads"
    When I click on new lead button under flex leads
    Then I should see content "Lead Edit"
    When I fill all mandantory fields to create a new leads
    And I fill "testpe@positiveedge.net" in email field
    And I click on "Save" button from top row