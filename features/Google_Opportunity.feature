@google-opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  @US-003694 @US-003953 @US-003787 @US-003791 @US-003792 @US-003919 @om-opp @or-opp
  Scenario: US-003694 US-003953 US-003787 US-003791 US-003792 US-003919 Add Google SFDC ID Original Order Number and DirectChannel to page layout
    Given I should navigate to opportunity tab in saleforce application
    And I wait for 5 seconds
    Then I should see salesforce Opportunity page succesfully
    And I should see the following:
      """
      Opportunities
      Home
      """
    When I follow on "New" button
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button from bottom row
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see content "Opportunity Edit"
    And I should see default value "Volume" for "Opportunity Type" picklist
    And I should see default value "TBD" for "Client Territory" picklist
    And I should see "Google SFDC ID" field with read and write permission
    And I should see "Original Order Number" field with read and write permission
    And I should see "Direct/Channel" field with read and write permission
    And I should verify business line picklist values
    And I should verify Client Territory picklist values
    And I should verify Renewal Currencies picklist values
    And I should verify SSI Theatre picklist values
    And I should verify Client Regions picklist values
    And I should see program type field with read and write permission except for sales ops
    And I should verify program type picklist values
    And I should see "Vertical" field with read and write permission
    And I should verify Vertical picklist values in opportunity page
    And I should see "Client ID" field with read and write permission
    And I should see "Type of Opportunity" field with read and write permission
    And I should verify Type of Opportunity picklist values

   @US-003694 @US-003953 @US-003787 @US-003791 @US-003792 @US-003919 @sm-opp @sr-opp
  Scenario: US-003694 US-003953 US-003787 US-003791 US-003792 US-003919 Add Google SFDC ID Original Order Number and DirectChannel to page layout
    Given I should navigate to "Opportunities" tab in saleforce application
    Then I should see the following:
      """
      Opportunities
      Home
      """
    When I search existing opportunity and click
    And I click on "Edit" button on top button row
    And I should see default value "Volume" for "Opportunity Type" picklist
    And I should see default value "TBD" for "Client Territory" picklist
    And I should see "Google SFDC ID" field with read and write permission
    And I should see "Original Order Number" field with read and write permission
    And I should see "Direct/Channel" field with read and write permission
    And I should verify business line picklist values
    And I should verify Client Territory picklist values
    And I should verify Renewal Currencies picklist values
    And I should verify SSI Theatre picklist values
    And I should verify Client Regions picklist values
    And I should see program type field with read and write permission except for sales ops
    And I should verify program type picklist values
    And I should see "Vertical" field with read and write permission
    And I should verify Vertical picklist values in opportunity page
    And I should see "Client ID" field with read and write permission
    And I should see "Type of Opportunity" field with read and write permission
    And I should verify Type of Opportunity picklist values



  @US-003753 @admin-opp @om-opp @or-opp
  Scenario: US-003753 update Opportunity Product
    Given I should navigate to opportunity tab in saleforce application
    Then I should see the following:
      """
      Opportunities
      Home
      """
    When I follow on "New" button
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button from bottom row
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see content "Opportunity Edit"
    And I fill all mandantory fields to create a new opportunity
    And I click on "Save" button on top button row
    Then I should see content "Opportunity Detail"
    When I click on new quote button under quotes section
    Then I should see the following:
      """
      Quote
      New Quote
      """
    When I fill quote name under quote information section
    And I click on "Save" button on top button row
    Then I should see content "Quote Detail"
    
  @US-003696-1 @admin-opp @om-opp @or-opp
  Scenario: US-003696 update Opportunity Product
    Given I should navigate to opportunity tab in saleforce application
    Then I should see the following:
      """
      Opportunities
      Home
      """
    When I follow on "New" button
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button from bottom row
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see content "Opportunity Edit"
    And I fill all mandantory fields to create a new opportunity
    And I click on "Save" button on top button row
    Then I should see content "Opportunity Detail"
    When I click on new quote button under quotes section
    Then I should see the following:
      """
      Quote
      New Quote
      """
    When I fill quote name under quote information section
    And I click on "Save" button on top button row
    Then I should see content "Quote Detail"
    When I click on add line item under quote line items
    Then I should see content "Find Products"

  @US-003697 @admin-opp @om-opp @or-opp
  Scenario: US-003697 Update to Renewable Line Item
    Given I should navigate to opportunity tab in saleforce application
    Then I should see the following:
      """
      Opportunities
      Home
      """
    When I follow on "New" button
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button from bottom row
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see content "Opportunity Edit"
    And I fill all mandantory fields to create a new opportunity
    And I click on "Save" button on top button row
    Then I should see content "Opportunity Detail"
    When I click on new renewable line item button
    Then I should see content "Renewable Line Item"
    When I fill all mandantory fields to create new renewable line item
    And I click on "Save" button on top button row
    Then I should see content "Renewable Line Item Detail"
    When I click on opportunity link under renewal relationship details
    Then I should see content "Opportunity Detail"
    And I click on "Edit" button on top button row
    And I should see Covered Product field in opportunity edit page
    And I should see Existing Product field in opportunity edit page

  @US-003690 @admin-opp @om-opp @or-opp
  Scenario: US-003690 SSI ZTH Stage Closed Sale
    Given I should navigate to opportunity tab in saleforce application
    Then I should see the following:
      """
      Opportunities
      Home
      """
    When I follow on "New" button
    Then I should see the following:
      """
      New Opportunity
      Select Opportunity Record Type
      """
    When I select "Opportunity - Edit" from record type of new record picklist
    And I click on "Continue" button from bottom row
    Then I should see the following:
      """
      Opportunity Edit
      New Opportunity
      """
    And I should see content "Opportunity Edit"
    And I fill all mandantory fields to create a new opportunity
    And I click on "Save" button on top button row
    Then I should see content "Opportunity Detail"
    When I click on new renewable line item button
    Then I should see content "Renewable Line Item"
    When I fill all mandantory fields to create new renewable line item
    And I click on "Save" button on top button row
    Then I should see content "Renewable Line Item Detail"
    When I click on opportunity link under renewal relationship details
    Then I should see content "Opportunity Detail"
    When I click on new quote button
    Then I should see the following:
      """
      Quote
      New Quote
      """
    When I fill quote name under quote information section
    And I click on "Save" button on top button row
    Then I should see content "Quote Detail"
    When I click on opporunity name under quote detail
    Then I should see content "Opportunity Detail"
    When I click on "Edit" button on top button row
    And I select "closed sale" from stage picklist
    And I click on "Save" button on top button row
    Then I should see content "Error: Invalid Data."  

  @US-003919 @US-003953 @US-003925 @so-opp
  Scenario: US-003919 US-003953 US-003925 Add Vertical picklist field to Channel Opportunity page layout
    Given I should navigate to "Opportunities" tab in saleforce application
    Then I should see the following:
      """
      Opportunities
      Home
      """
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    And I should see content "Type of Opportunity"
    And I should see content "Vertical"
    And I should see content "Client ID"
    And I should see content "Business Line"
    And I should see content "SSI Theatre"
    And I should see content "Client Territory"
    And I should see content "Google SFDC ID"
    And I should see content "Direct/Channel"
    And I should see content "Original Order Number"