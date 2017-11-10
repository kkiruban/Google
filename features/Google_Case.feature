@google @cases
Feature:
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to Cases tab in saleforce application

  @US-003693_1 @Salesrep_cases @Salesmgr_cases
  Scenario: US-003693 case types by persona
    Given I follow on "New" button
    When I check the picklist value of record type of new record for sales mgr and slaes rep
    And I select "Lead Submission" from record type of new record
    And I check that case record type field shows lead submission
    And I enter the mandatory field values under new case for lead submission
    Then I click on "Save" button from top row
    And I should navigate to "Cases" tab
    And I follow on "New" button
    And I select "Data Update Request" from record type of new record
    And I check that case record type field shows "Data Update Request"
    And I enter the mandatory field values under new case for data update request
    And I select "High" option from "Priority" picklist
    Then I click on "Save" button from top row

  @US-003693_2 @Opsrep_cases @Opsmgr_cases
  Scenario: US-003693 case types by persona
    Given I follow on "New" button
    When I check the picklist value of record type of new record for ops mgr and ops rep
    And I select "Quote Request" from record type of new record
    And I check that case record type field shows "Quote Request"
    And I enter the mandatory field values under new case for quote request
    And I select "Normal" option from "Priority" picklist
    Then I click on "Save" button from top row

  @US-003693_3 @Salesops-cases
  Scenario: US-003693 case types by persona
    Given I follow on "New" button
    When I check the picklist value of record type of new record under new case for sales ops
    And I select "Booking Request" from record type of new record
    And I check that case record type field shows "Booking Request"
    And I enter the mandatory field values under new case for booking request
    And I select "Low" option from "Priority" picklist
    Then I click on "Save" button from top row

  @US-003687_1 @Salesrep_cases @Salesmgr_cases
  Scenario: US-003687 changed custom to yes for all sla
    Given I follow on "New" button
    When I select "Data Update Request" from record type of new record
    And I enter the mandatory field values under new case for data update request
    And I select "High" option from "Priority" picklist
    And I click on "Save" button from top row
    Then I check case milestone and target date value for date update request

  @US-003687_2 @Opsrep_cases @Opsmgr_cases
  Scenario: US-003687 changed custom to yes for all sla
    Given I follow on "New" button
    And I select "Quote Request" from record type of new record
    And I enter the mandatory field values under new case for quote request
    And I select "Normal" option from "Priority" picklist
    And I click on "Save" button from top row
    Then I check case milestone and target date value for quote request

  @US-003687_3 @Opsrep_cases @Opsmgr_cases
  Scenario: US-003687 changed custom to yes for all sla
    Given I follow on "New" button
    When I select "Booking Request" from record type of new record
    And I enter the mandatory field values under new case for booking request
    And I select "Low" option from "Priority" picklist
    And I click on "Save" button from top row
    Then I check case milestone and target date value for booking request

  @US-003687_4 @Salesrep_cases
  Scenario: US-003687 changed custom to yes for all sla
    Given I follow on "New" button
    When I select "Booking Request" from record type of new record
    And I enter the mandatory field values under new case for booking request
    And I select "Low" option from "Priority" picklist
    And I click on "Save" button from top row
    And I note the case number which is just created
    And I click on "Edit" button from top row
    And I check the request escalation check box
    And I enter value in the escalation reason field
    And I click on "Save" button from top row
    And I check that lock icon appears next to edit button
    And I logout from the current user
    Given I should login as a "SalesManager"
    When I should navigate to "Home" tab
    And I click "Approve/Reject" link for the specific Case in home tab
    And I should click on approve button
    And I check priority and escalated value
    Then I check case milestone and target date value under case management section

  @US-003687_5
  Scenario: US-003687 changed custom to yes for all sla
    Given I follow on "New" button
    When I select "Booking Request" from record type of new record
    And I enter the mandatory field values under new case for booking request
    And I select "Low" option from "Priority" picklist
    And I click on "Save" button from top row
    And I note the case number which is just created
    And I click on "Edit" button from top row
    And I check the request escalation check box
    And I enter value in the escalation reason field
    And I click on "Save" button from top row
    And I check that lock icon appears next to edit button
    And I logout from the current user
    Given I should login as a "OpsManager"
    When I should navigate to "Home" tab
    And I click "Approve/Reject" link for the specific Case in home tab
    And I should click on approve button
    And I check priority and escalated value
    Then I check case milestone and target date value under case management section

  @US-003689 @Salesrep_cases @Salesmgr_cases @Opsrep_cases @Opsmgr_cases
  Scenario Outline: US-003689 disable no service approval process
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "Data Update Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    And I select "<subcastetype>" from sub case type picklist under case information
    And I select "<ssiresultreason>" from ssi result reason
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    And I choose opportunity through lookup field
    And I click on "Save" button on top button row
    And I wait for 10 seconds
    Then I should see content "Case Detail"
    And I should get recently created case
    And I should see content "Approval History"
    And I logout from the current user
    Given I should login as a "OpsManager"
    And I wait for 5 seconds
    When I search recently created case and click on underlined case
    And I wait for 5 seconds
    Then I should see content "Case Detail"
    And I should see content "Approval History"
    And I logout from the current user
    Given I should login as a "SalesManager"
    And I wait for 5 seconds
    When I search recently created case and click on underlined case
    And I wait for 5 seconds
    Then I should see content "Case Detail"
    And I should see content "Approval History"

    Examples:
      | subcastetype  | ssiresultreason           |
      | No Service    | NS - Billing Issues – CBI |
      | House Account | HA - Bad Data - BDT       |

  @US-003689 @Salesops-cases
  Scenario Outline: US-003689 disable no service approval process
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "Data Update Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    And I select "<ssiresultreason>" from ssi result reason
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    And I choose opportunity through lookup field
    And I click on "Save" button on top button row
    And I wait for 10 seconds
    Then I should see content "Case Detail"
    And I should get recently created case
    And I should see content "Approval History"
    And I logout from the current user
    Given I should login as a "OpsManager"
    And I wait for 5 seconds
    When I search recently created case and click on underlined case
    And I wait for 5 seconds
    Then I should see content "Case Detail"
    And I should see content "Approval History"
    And I logout from the current user
    Given I should login as a "SalesManager"
    And I wait for 5 seconds
    When I search recently created case and click on underlined case
    And I wait for 5 seconds
    Then I should see content "Case Detail"
    And I should see content "Approval History"

    Examples:
      | subcastetype  | ssiresultreason                       |
      | No Service    | NS - Client Product Replacement - PTR |
      | House Account | HA - Covered - COV                    |

  @US-003711 @Salesrep_cases @Salesmgr_cases @Opsrep_cases @Opsmgr_cases
  Scenario: US-003711 Updated validation rule for data update request case
    When I follow on "New" button
    And I wait for 5 seconds
    And I select "Data Update Request" from record type of new record picklist
    And I click on "Continue" button under select opportunity record type
    And I wait for 5 seconds
    Then I should see the following:
      """
      Case Edit
      New Case
      """
    And I should see content "Case Edit"
    And I should see content "Case Information"
    And I select "No Service" from sub case type picklist under case information
    #    And I select "<ssiresultreason>" from ssi result reason
    Then I should see content "Description Information"
    When I fill in description with "testing" under description information row
    And I choose contact name through look up field
    And I choose opportunity through lookup field
    And I click on "Save" button on top button row
    And I wait for 10 seconds
    Then I should see "Error: Invalid Data." error
    And I should see "The following field cannot be blank : Renewal Status when Sub Case Type = Closed Sale, House Account or No Service" error
