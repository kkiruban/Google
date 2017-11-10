@google @mytasks
Feature:
  In order to validate tasks section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Home" tab in saleforce application

  @US-003698 @US-004024 @US-004034 @admin-task @om-task @or-task @sm-task @sr-task @so-task
  Scenario: US-003698 US-004024 task types by persona
    Given I click on new button under my task section
    When I check that the picklist value of record type of new record
    And I select "Task - Email" from record type of new record
    And I enter data to all the mandatory fields to create task email
    Then I should see Success Plan Play lookup field with read and write permission
    When I click on "Save" button from top row
    Then I should see content "Dashboard"
    When I click on any existing newly created task email in my task section
    Then I should see Set Play Outcome button
    And I should see Create Follow-up CSM Task button
    But I should not see Create Follow-Up Event button

  @US-003698 @US-004024 @US-004034 @admin-task @om-task @or-task @sm-task @sr-task @so-task
  Scenario: US-003698 US-004024 task types by persona
    Given I click on new button under my task section
    When I check that the picklist value of record type of new record
    And I select "Task - Phone Calls" from record type of new record
    And I enter data to all the mandatory fields to create task phone calls
    Then I should see Success Plan Play lookup field with read and write permission
    Then I click on "Save" button from top row
    Then I should see content "Dashboard"
    When I click on any existing newly created task phone call in my task section
    Then I should see Set Play Outcome button
    And I should see Create Follow-up CSM Task button
    But I should not see Create Follow-Up Event button

  @US-003698 @US-004024 @US-004034 @admin-task @om-task @or-task @sm-task @sr-task @so-task
  Scenario: US-003698 US-004024 task types by persona
    Given I click on new button under my task section
    When I check that the picklist value of record type of new record
    And I select "Task - Standard" from record type of new record
    And I enter data to all the mandatory fields to create task standard
    Then I should see Success Plan Play lookup field with read and write permission
    Then I click on "Save" button from top row
    Then I should see content "Dashboard"
    When I click on any existing newly created task standard in my task section
    Then I should see Set Play Outcome button
    And I should see Create Follow-up CSM Task button
    But I should not see Create Follow-Up Event button

  @US-003954 @US-004023 @US-004024 @US-004034 @admin-task @om-task @or-task @sm-task @sr-task
  Scenario: US-003954 US-004023 US-004024 Add Health Check Task Record Type
    Given I click on new button under my task section
    When I check that the picklist value of record type of new record
    And I select "Task - Health Check" from record type of new record
    Then I should see at risk reason picklist under health check details section
    And I should verify risk reason picklist field permission except sales ops
    And I should verify risk reason picklist values
    And I should see Achieved APIs multiple picklist
    And I should verify Achieved APIs multiple picklist values
    And I should see Desired APIs multiple picklist
    And I should verify Desired APIs multiple picklist values
    And I should see Use Cases multiple picklist
    And I should verify Use Cases multiple picklist values
    And I should see Achieved End Points multiple picklist
    And I should verify Achieved End Points multiple picklist values
    And I should see Desired End Points multiple picklist
    And I should verify Desired End Points multiple picklist values
    And I should see health check picklist
    And I should verify health check picklist values
    And I should see contact lookup field
    When I enter all mandantory field to create a new task with health check task
    Then I should see Success Plan Play lookup field with read and write permission
    And I click on "Save" button from top row
    Then I should see content "Dashboard"
    When I click on any existing zenith task health check link in my task section
    Then I should see Set Play Outcome button
    And I should see Create Follow-up CSM Task button
    But I should not see Create Follow-Up Event button
    When I click on "Edit" button from top row
    And I wait for 15 seconds
    And I select status as "Completed Successfully"
    And I wait for 15 seconds
    And I click on "Save" button from top row