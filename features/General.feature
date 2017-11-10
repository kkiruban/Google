Feature: General
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test caseNumber of New Cases

  Background:
    Given I should navigate to Home tab in saleforce application

  @US-003686-1 @Admin_general
  Scenario: US-003686 Base Configuration
    And I navigate to Manage Currencies page
    Then I should see Currency Code "JPY"
    And I should see Currency Code "USD"
    And I should see Currency Code "GBP"
    And I should see Currency Code "EUR"

  @US-003688_0123 @Admin_general
  Scenario: US-003688 Added Tokyo timezone to Business Hours tab
    When I selected "Setup" from user menu
    And I clicked the "Company Profile" link under "Administration Setup"
    And I click "Business Hours" link under "Company Profile"
    And I clicked the link "APAC (TOK)"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I click "Business Hours" link under "Company Profile"
    And I clicked the link "APAC (SIN/KL)"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I click "Business Hours" link under "Company Profile"
    And I clicked the link "NALA"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I click "Business Hours" link under "Company Profile"
    And I clicked the link "EMEA"
    Then I should see "Sunday" as "No Hours"
    And I should see "Monday" as "8:00 AM" and "to" and "12:00 AM"
    And I should see "Tuesday" as "24 Hours"
    And I should see "Wednesday" as "24 Hours"
    And I should see "Thursday" as "24 Hours"
    And I should see "Friday" as "12:00 AM" and "to" and "5:00 PM"
    And I should see "Saturday" as "No Hours"
    And I click "Business Hours" link under "Company Profile"

  @US-003690_0123 @Admin_general
  Scenario: US-003690 Disabled Rule:  SSI_ZTH__Stage_Closed_Sale
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I click "Opportunities" link under "Customize"
    And I click "Validation Rules" link under "Opportunities"
    Then I should see "Stage_Closed_Sale" active checkbox unchecked

  @US-003692-u @Admin_general
  Scenario: US-003692 Updated Users tab to align users
    When I selected "Setup" from user menu
    And I clicked the "Manage Users" link under "Administration Setup"
    And I click "Users" link under "Manage Users"
    Then I should verify users

  @US-003716 @Admin_general
  Scenario: US-003716 Updated Users tab to align users
    When I selected "Setup" from user menu
    And I clicked the "Manage Users" link under "Administration Setup"
    And I click on Permission Sets link under administration setup
    Then I should see content "Permission Sets"
    When I click on SSI Zenith Read Only Permission link
    Then I should see content "SSI Zenith Read Only Permission"
    When I click on system permission link under system section
    Then I should see content "SSI Zenith Read Only Permission"
    When I click on Edit button under system permission
    And I Verify View All Data permission to be checked
    And I verify Manage Dashboards permission to be checked

    @US-003984 @Admin_general
    Scenario: US-003984 Updated Users tab to align users
    When I selected "Setup" from user menu
    And I click on custom settings link under develop
    Then I should see content "Custom Settings"
    When I click on CSM Batch Jobs link under custom setting table
    Then I should see content "CSM Batch Jobs"
    Then I should see content "CSM_BatchCreatePlayScheduledDispatcher"

    @US-003983 @Admin_general
    Scenario: US-003983 Updated Users tab to align users
    When I selected "Setup" from user menu
    And I click on create link under app setup
    And I click Workflow and Approvals link under app setup
    And I click on process builder under workflow and approvals
    Then I should see content "Health Check Task Process"

     @US-003793  @US-003794 @Admin_general
    Scenario: US-003983  US-003794 Add fields to Opportunity Product Page
    When I selected "Setup" from user menu
    And I click on customize link under app setup
    And I click on opportunity link under customize
    And I click on fields under opportunity
    Then I should see content "Renewal Target"

   @US-003793  @US-003794 @Admin_general
    Scenario: US-003983  US-003794 Add fields to Opportunity Product Page
    When I selected "Setup" from user menu
    And I click on customize link under app setup
    And I click on opportunity link under customize
    And I click on opportunity prooduct under opportunity
    And I click on fields under opportunity products
    Then I should see content "Renewal Target"
    And I should see content "Renewal Status"

    @US-004021 @Admin_general
    Scenario: US-004021 Add fields to Opportunity Product Page
    When I selected "Setup" from user menu
    And I click on Monitoring link under Administration Setup
    And I click on Scheduled Jobs under mointoring link
    Then I should see content "CSM_BatchCreatePlayScheduledDispatcher"
    When I click manage link for CSM DailyBatchMetricsUpdateDispatchr
    Then I should see content "Schedule Apex"
    And I should see Preferred Hour as "12.00 AM"
    And I should see the Frequency daily

   @US-004021 @Admin_general
    Scenario: US-004021 Add fields to Opportunity Product Page
    When I selected "Setup" from user menu
    And I click on Monitoring link under Administration Setup
    And I click on Scheduled Jobs under mointoring link
    Then I should see content "CSM_MstrScheduledDispatcher"
    When I click manage link for CSM MstrScheduledDispatcher
    Then I should see content "Schedule Apex"
    And I should see Preferred Hour as "12.00 AM"
    And I should see the Frequency daily

    @US-004021 @Admin_general
    Scenario: US-004021 Add fields to Opportunity Product Page
    When I selected "Setup" from user menu
    And I click on Monitoring link under Administration Setup
    And I click on Scheduled Jobs under mointoring link
    Then I should see content "CSM_BatchCreatePlayScheduledDispatcher"
    When I click manage link for CSM BatchCreatePlayScheduledDispatcher
    Then I should see content "Schedule Apex"
    And I should see Preferred Hour as "12.00 AM"
    And I should see the Frequency daily

    @US-004022 @Admin_general
    Scenario: US-004022 Add fields to Opportunity Product Page
    When I selected "Setup" from user menu
    And I click on develop link to expand
    And I click on custom settings link under develop
    Then I should see content "Custom Settings"
    When I click on CSM Admin link
    And I click on Inherit Task Record Type link

    @US-004032 @Admin_general
    Scenario: US-004032 Added CSM Permission for Sales Rep and Added CSM Net Ops Permission for Sales Managers
    When I selected "Setup" from user menu
    And I clicked the "Manage Users" link under "Administration Setup"
    And I click on Permission Sets link under administration setup
    Then I should see content "Permission Sets"
    When I click "Users" link under "Manage Users"
    And I click on random user
    Then I should see content "CSM"
    And I should see content "CSM NetOps"