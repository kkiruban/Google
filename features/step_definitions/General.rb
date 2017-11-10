require 'win32ole'

Given(/^I should navigate to Accounts tab in saleforce application$/) do
  step 'I enter the credentials to the Zenith application'
  sleep 5
  find(:xpath,"//*[@id='Account_Tab']/a").click
  sleep 5
end

When(/^I click on Manage Currencies button$/) do
  find(:xpath,"//input[@value='Manage Currencies']").click
  sleep 10
end
When(/^I navigate to Manage Currencies page$/) do
  visit "https://na30.salesforce.com/setup/cur/currencylist.jsp"
  sleep 20
end

When(/^I click on Monitoring link under Administration Setup$/) do
  find(:xpath,"//*[@id='Monitoring_font']").click
  sleep 10
end

When(/^I click on Scheduled Jobs under mointoring link$/) do
  find(:xpath,"//*[@id='ScheduledJobs_font']").click
  sleep 10
end

When(/^I click manage link for CSM DailyBatchMetricsUpdateDispatchr$/) do
  find(:xpath,"//tr[th[contains(text(),'CSM_DailyBatchMetricsUpdateDispatchr')]]/td[1]/a[1]").click
  sleep 5
end

When(/^I click manage link for CSM MstrScheduledDispatcher$/) do
  find(:xpath,"//tr[th[contains(text(),'CSM_MstrScheduledDispatcher')]]/td[1]/a[1]").click
  sleep 5
end

When(/^I click manage link for CSM BatchCreatePlayScheduledDispatcher$/) do
  find(:xpath,"//tr[th[contains(text(),'CSM_BatchCreatePlayScheduledDispatcher')]]/td[1]/a[1]").click
  sleep 5
end

Then(/^I should see Preferred Hour as "([^"]*)"$/) do |value|
  if page.has_select?("pst0", :selected => value)
    puts "Preferred Hour is 12.00 AM"
  elsif page.has_field?('pst0')
    writeFailure "#{find_field('pst0').find('option[selected]').text} is preferred hour"
  else
    writeFailure "Preferred Hour field is not visible"
  end
end

Then(/^I should see the Frequency daily$/) do
  if has_checked_field?('ww00')
    puts "sunday is checked"
  else
    writeFailure "sunday is not checked"
  end
  if has_checked_field?('ww10')
    puts "monday is checked"
  else
    writeFailure "monday is not checked"
  end
  if has_checked_field?('ww20')
    puts "tuseday is checked"
  else
    writeFailure "tuseday is not checked"
  end
  if has_checked_field?('ww30')
    puts "wednesday is checked"
  else
    writeFailure "wednesday is not checked"
  end
  if has_checked_field?('ww40')
    puts "Thursday is checked"
  else
    writeFailure "Thursday is not checked"
  end
  if has_checked_field?('ww50')
    puts "friday is checked"
  else
    writeFailure "friday is not checked"
  end
  if has_checked_field?('ww60')
    puts "saturday is checked"
  else
    writeFailure "saturday is not checked"
  end
end

When(/^I click on CSM Batch Jobs link under custom setting table$/) do
  sleep 5
  find(:xpath,"//a[contains(text(),'CSM Batch Jobs')]").click
  sleep 5
end

When(/^I click on customize link under app setup$/) do
  sleep 5
  find(:xpath,".//*[@id='Customize_font']").click
  sleep 5
end

When(/^I click on opportunity link under customize$/) do
  sleep 5
  find(:xpath,"//*[@id='Opportunity_font']").click
  sleep 5
end

When(/^I click on fields under opportunity$/) do
  sleep 5
  find(:xpath,"//*[@id='OpportunityFields_font']").click
  sleep 5
end

When(/^I click on opportunity prooduct under opportunity$/) do
  sleep 5
  find(:xpath,".//*[@id='OpportunityLineItem_font']").click
  sleep 5
end

When(/^I click on develop link to expand$/) do
  sleep 5
  find(:xpath,"//*[@id='DevToolsIntegrate_font']").click
  sleep 5
end

When(/^I click on fields under opportunity products$/) do
sleep 5
  find(:xpath,".//*[@id='OpportunityLineItemFields_font']").click
  sleep 5
end

When(/^I click on create link under app setup$/) do
  sleep 5
  find(:xpath,".//*[@id='DevTools_font']").click
  sleep 5
end

When(/^I click on CSM Admin link$/) do
  click_on 'CSM Admin'
  sleep 5
end

When(/^I click on Inherit Task Record Type link$/) do
  click_on 'Inherit Task Record Type'
  sleep 5
end

When(/^I click Workflow and Approvals link under app setup$/) do
  sleep 5
  find(:xpath,".//*[@id='Workflow_font']").click
  sleep 5
end

When(/^I click on process builder under workflow and approvals$/) do
  sleep 5
  find(:xpath,".//*[@id='ProcessAutomation_font']").click
  sleep 5
end


When(/^I click on custom settings link under develop$/) do
  sleep 5
  find(:xpath,"//*[@id='DevToolsIntegrate_font']").click
  sleep 5
  find(:xpath,"//*[@id='CustomSettings_font']").click
  sleep 5
end

When(/^I click on Permission Sets link under administration setup$/) do
  find(:xpath,"//*[@id='PermSets_font']").click
  sleep 5
end

When(/^I click on SSI Zenith Read Only Permission link$/) do
  find(:xpath,"//span[contains(text(),'SSI Zenith Read Only Permission')]").click
  sleep 10
end

When(/^I click on system permission link under system section$/) do
  find(:xpath,"//a[contains(text(),'System Permissions')]").click
  sleep 5
end

When(/^I click on Edit button under system permission$/) do
  find(:xpath,"//a[contains(text(),'Edit')]").click
  sleep 20
end

When(/^I Verify View All Data permission to be checked$/) do
  #  if page.has_checked?('page:console:j_id77:j_id78:j_id79:permissions_form:permissions_pb:j_id97:j_id98:j_id104:0:j_id105:j_id106:101:userPerm')
  #     puts "View All Data permission is checked"
  #  else
  #     writeFailure "View All Data permission is not checked"
  #  end

  if page.has_checked_field?('page:console:j_id77:j_id78:j_id79:permissions_form:permissions_pb:j_id97:j_id98:j_id104:0:j_id105:j_id106:101:userPerm')
    puts "View All Data permission is checked"
  else
    writeFailure "View All Data permission is not checked"
  end

  #  find(:xpath, ".//input[@title='ViewAllData']").set(true)
  #  sleep 5
end

When(/^I verify Manage Dashboards permission to be checked$/) do
  if find(:xpath, ".//input[@title='ManageDashbdsInPubFolders']").set(true)
    puts "Manage Dashboards permission is checked"
  else
    writeFailure "Manage Dashboards permission is checked"
  end
  sleep 5
end

#click on tab
When(/^I navigate to "([^"]*)" tab in the application$/) do |tab|
  sleep 5
  if page.has_xpath?('//li/a[text()="'"#{tab}"'"]')
    find(:xpath, '//li/a[text()="'"#{tab}"'"]').click
    puts "The #{tab} tab has been clicked"
  elsif page.has_xpath?('//img[@title="All Tabs"]')
    find(:xpath, '//img[@title="All Tabs"]').click
    sleep 3
    find(:xpath, '//a[text()="'"#{tab}"'"]').click
    puts "The #{tab} tab has been clicked"
  else
    writeFailure "Fail to find tab - #{tab} -"
    #fail(ArgumentError.new('Fail to find tab - '+ tab))
  end
end


#Step definition for searching and selecting an account
Then(/^I select "(.*?)" account record$/) do |accout_Name|
  if page.has_xpath?('//input[@title="Search..."]')
    #The opportunity is of type "Opportunity Asset - Edit Books"
    find(:xpath, '//input[@title="Search..."]').set accout_Name
    sleep 2
    find(:xpath, '//input[@value="Search"]').click
    sleep 5
  end
  if page.has_xpath?('//div[contains(@class,"accountBlock")]')
    within(:xpath, '//div[contains(@class,"accountBlock")]')do
      if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
        find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
        puts "The record #{accout_Name} is accout is found and selected"
      else
        writeFailure "Fail to search given account record"
      end
    end
  end
end

#Step definition for searching and selecting an account
Then(/^I select existing account record$/) do
  if page.has_xpath?('//input[@title="Search..."]')
    #The opportunity is of type "Opportunity Asset - Edit Books"
    if (ENV['UserRole']=="nalaopsmgrsit")
      accout_Name="smoke Test-Account-Ops_Mgr"
      #puts "#{accout_Name}"
    elsif (ENV['UserRole']=="nalaopsrepsit")
      accout_Name="smoke Test-Account-Ops_Rep"
      #puts "#{accout_Name}"
    elsif (ENV['UserRole']=="Admin")
      accout_Name="smoke Test-Account-Ba"
      #puts "#{accout_Name}"
    elsif (ENV['UserRole']=="nalasalesrepsit")
      accout_Name="smoke Test-Account-Sales_Rep"
      #puts "#{accout_Name}"
    elsif (ENV['UserRole']=="nalasalesmgrsit")
      accout_Name="smoke Test-Account-Sales_Mgr"
      # puts "#{accout_Name}"
    elsif (ENV['UserRole']=="nalasalesopssit")
      accout_Name="smoke Test-Account-Sales_Ops"
      #puts "#{accout_Name}"
    end
    find(:xpath, '//input[@title="Search..."]').set accout_Name
    sleep 2
    find(:xpath, '//input[@value="Search"]').click
    sleep 5
  end
  if page.has_xpath?('//div[contains(@class,"accountBlock")]')
    within(:xpath, '//div[contains(@class,"accountBlock")]')do
      if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
        find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
        puts "The record - #{accout_Name} - is found and selected"
      else
        writeFailure "Fail to search - #{accout_Name} - record"
      end
    end
  end
end

When(/^I click on random user$/) do
  click_on 'Google, Operations Manager'
  sleep 10
end

#Step definition to verify field not present over the page
Then(/^I should not see the field "([^"]*)"$/) do |field_name|
  Capybara.default_wait_time =2
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]')
    if page.has_field?(field_name)
      writeFailure"The - #{field_name} - is present over account detail page with -WR- permission"
    else
      writeFailure"The - #{field_name} - is present over account detail page with -R- permission"
      #fail(ArgumentError.new('Fail'))
    end
  else
    puts "The - #{field_name} - is -NOT- present over account detail page"
  end
  #end
  Capybara.default_wait_time =30
end

Then(/^I should see Client Theatre field under Data.com Key$/) do
  sleep 5
  if page.has_xpath?('//td[text()="Data.com Key"]/parent::tr[1]/following-sibling::tr[1]/td[3]')
    @fieldName=find(:xpath, '//td[text()="Data.com Key"]/parent::tr[1]/following-sibling::tr[1]/td[3]').text
    if @fieldName=="Client Theatre"
      puts "The field - Client Theatre - is present under Data.com Key field"
    else
      writeFailure"The field - Client Theatre - is not present under Data.com Key field"
      #fail(ArgumentError.new('Fail'))
    end
  end
end

Then(/^I should see field Type under Account field$/) do
  sleep 5
  if page.has_xpath?('//label[text()="Account Name"]/ancestor::tr[1]/following-sibling::tr[1]/td[1]')
    @fieldName=find(:xpath, '//label[text()="Account Name"]/ancestor::tr[1]/following-sibling::tr[1]/td[1]').text
    if @fieldName=="Type"
      puts "The field - Type - is present under Account field"
    else
      writeFailure"The field - Type - is not present under Account field"
      #fail(ArgumentError.new('Fail'))
    end
  end
end


# Clicking edit button
Then(/^I click Edit button from top button row$/) do
  sleep 5
  Capybara.default_wait_time =1
  #step 'I click Save button from top button row'
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Edit"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Edit"]').click
    puts "The Edit button has been clicked"
    #    Capybara.default_wait_time =30
    #    next
    #  else
    #    Capybara.default_wait_time =30
    #    next
  end
  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^I click Save button from top button row$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
    puts "The Save button has been clicked"
    #    Capybara.default_wait_time =30
    #    next
    #  else
    #    Capybara.default_wait_time =30
    #    next
  end
  Capybara.default_wait_time =30
end

#Step definition to verify if the field is present under a particular page section
Then(/^I should see the field "([^"]*)" is present under "([^"]*)" section$/) do |field_name, section|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('(//h3[text()="'"#{section}"'"]/parent::div[1]/following-sibling::div[1]//table)[1]')
    within(:xpath, '(//h3[text()="'"#{section}"'"]/parent::div[1]/following-sibling::div[1]//table)[1]')do
      if page.has_xpath?('//td[text()="'"#{field_name}"'"]')
        puts "The field -#{field_name}- is present under #{section} section"
      elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
        puts "The field -#{field_name}- is present under #{section} section"
      else
        writeFailure"The field  - #{field_name} - is NOT present under #{section} section"
        #fail(ArgumentError.new('Fail'))
      end
    end
  else
    writeFailure"The section - #{section} - is not present over the page"
  end
  Capybara.default_wait_time =30
end


#Step definition to verify if the field is present at the left hand side
Then(/^I should see the field "([^"]*)" in the left column$/) do |field_name|
  sleep 5
  if page.has_xpath?('//tr/td[1][text()="'"#{field_name}"'"]')
    puts "The field -#{field_name}- is present in the - left - column"
  else
    writeFailure"The given - #{field_name} - field is not present in the - left - column"
    #fail(ArgumentError.new('Fail'))
  end
end

#Step definition to verify if the field is present at the left hand side
Then(/^I should see the field "([^"]*)" in the right column$/) do |field_name|
  sleep 5
  if page.has_xpath?('//tr/td[3][text()="'"#{field_name}"'"]')
    puts "The field - #{field_name} - is present in the - right - column"
  else
    writeFailure"The - #{field_name} - field is not present in the - right - column"
    #fail(ArgumentError.new('Fail'))
  end
end

#Step definition to verify if the field is editable
Then(/^The field "([^"]*)" should be non editable$/) do |field_name|
  step 'I click Edit button from top button row'
  sleep 5
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/input')
    writeFailure"The - #{field_name} - field is -  editable -"
    #fail(ArgumentError.new('Fail'))
  else
    puts "The field - #{field_name} - is - Not Editable -"
  end
  step 'I click Save button from top button row'
end

#Step definition to verify date type field
Then(/^The field "([^"]*)" should be of date type$/) do |field_name|
  step 'I click Edit button from top button row'
  sleep 5
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/*[contains(@class,"dateInput")]')
    puts "The - #{field_name} - field is -  Date Type -"
    #fail(ArgumentError.new('Fail'))
  else
    writeFailure "The field - #{field_name} - is - Not Date Type  -"
  end
  #end
  step 'I click Save button from top button row'
end

#Step definition to click a button
Then(/^Click "([^"]*)" button$/) do |buttonName|
  sleep 5
  if page.has_xpath?('//input[@title="'"#{buttonName}"'"]')
    find(:xpath, '//input[@title="'"#{buttonName}"'"]').click
    puts "The button - #{buttonName} - has been clicked"
    #fail(ArgumentError.new('Fail'))
  else
    writeFailure "The button - #{buttonName} - NOT found"
  end
end

#Step to verify the drop down options appearing against requirement
Then(/^I should see "([^"]*)" field MultiSelectPicklist options$/) do |select_field|
  sleep 5
  begin
    step 'I click Edit button from top button row'
    arg=getDetails "CommonData"
    resultArray=[]
    expectedArrayOption=[]
    actualArrayOption=[]
    #  if page.has_xpath?('//td[text()="'"#{select_field}"'"]')
    #     writeFailure "The MultiSelectPicklist - #{select_field} - is appearing with - R Permission -"
    #     next
    #  end
    #  if page.has_no_xpath?('//td[text()="'"#{select_field}"'"]') and page.has_no_xpath?('//select[contains(@title,"'"#{select_field +" - Available"}"'")]')
    #     writeFailure "The MultiSelect Picklist - #{select_field} - is NOT present over the page"
    #     next
    #  end
    expectedArrayOption=arg[select_field]
    if page.has_xpath?('//select[contains(@title,"'"#{select_field +" - Available"}"'")]')
      actualArrayOption=find(:xpath, '//select[contains(@title,"'"#{select_field +" - Available"}"'")]').all('option').collect(&:text)
    elsif  page.has_xpath?('//td[text()="'"#{select_field}"'"]')
      writeFailure "The MultiSelectPicklist - #{select_field} - is appearing with - R Permission -"
      step 'I click Save button from top button row'
      next
    elsif page.has_no_xpath?('//td[text()="'"#{select_field}"'"]') and page.has_no_xpath?('//label[text()="'"#{select_field}"'"]')
      writeFailure "The MultiSelect Picklist - #{select_field} - is NOT present over the page"
      step 'I click Save button from top button row'
      next
    end
    #puts "Actual options are : #{actualArrayOption}"
    #puts "Expected Options are : #{expectedArrayOption}"

    resultArray=expectedArrayOption.sort-actualArrayOption.sort
    if resultArray.count==0
      puts "The expected options for the dropdown - #{select_field} - is present"
    else
      writeFailure "The following options are not present in the dropdown"
      writeFailure resultArray
    end
    resultArray=actualArrayOption.sort-expectedArrayOption.sort
    if resultArray.count!=0
      writeFailure "The following extra option are appearing in the dropdown"
      writeFailure resultArray
    end
    #  end
    step 'I click Save button from top button row'
    sleep 5
  rescue Exception => ex
    step 'I click Save button from top button row'
		writeFailure "Error while verifying - #{select_field} - MultiSelectPicklist option"
		writeFailure ex.message
  end
end


#Step definition to click a button
Then(/^I should see the field "([^"]*)" as numeric type$/) do |field_name|
  sleep 5
  step 'I click Edit button from top button row'
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/input')
    sleep 5
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/input').set "AAAAAA"
    step 'I click Save button from top button row'
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]/div/strong[text()="Error:"]')
      puts "The #{field_name} is numeric type"
      step 'I click Cancel button from top button row'
    else
      writeFailure "The #{field_name} is NOT a numeric field"
    end
  elsif page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    writeFailure "The field - #{field_name} - is appearing with - R Permission -"
    #next
  else
    writeFailure "The field - #{field_name} - is not present over the page"
  end
  step 'I click Save button from top button row'
end

# Clicking Save button
Then(/^I click Cancel button from top button row$/) do
  sleep 5
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Cancel"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Cancel"]').click
    next
    sleep 5
  else
    writeFailure "Fail to click Cancel buttton"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
end

#Step definition to verify if the field is editable
Then(/^The field "([^"]*)" should be non-editable$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  step 'I click Edit button from top button row'
  if page.has_xpath?('//td[text()="'"#{field_name}"'"]')
    puts "The field - #{field_name} - is - NON EDITABLE -"
  elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input')
    writeFailure"The - #{field_name} - field is -  EDITABLE -"
    #fail(ArgumentError.new('Fail'))
  elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//select')
    writeFailure"The - #{field_name} - field is -  EDITABLE -"
  elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
    puts"The - #{field_name} - field is -  NON EDITABLE -"
  else
    writeFailure "The field - #{field_name} - is not present over the page"
  end
  step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

#Step definition to verify if the field is editable
Then(/^The field "([^"]*)" should be non-editable for sales role$/) do |field_name|
  sleep 5
  if ENV['UserRole'] == "nalasalesmgrsit" || ENV['UserRole'] == "nalasalesrepsit"
    Capybara.default_wait_time =1
    step 'I click Edit button from top button row'
    if page.has_xpath?('//td[text()="'"#{field_name}"'"]')
      puts "The field - #{field_name} - is - NON EDITABLE -"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input')
      writeFailure"The - #{field_name} - field is -  EDITABLE -"
      #fail(ArgumentError.new('Fail'))
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//select')
      writeFailure"The - #{field_name} - field is -  EDITABLE -"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
      puts"The - #{field_name} - field is -  NON EDITABLE -"
    else
      writeFailure "The field - #{field_name} - is not present over the page"
    end
    step 'I click Save button from top button row'
    Capybara.default_wait_time =30
  end
end

#Step definition to verify if the field is editable
Then(/^The field "([^"]*)" should be editable for ops role$/) do |field_name|
  sleep 5
  if ENV['UserRole'] == "nalaopsmgrsit" || ENV['UserRole'] == "nalaopsrepsit"
    Capybara.default_wait_time =1
    step 'I click Edit button from top button row'
    if page.has_xpath?('//td[text()="'"#{field_name}"'"]')
      writeFailure "The field - #{field_name} - is - NON EDITABLE -"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input')
      puts"The - #{field_name} - field is -  EDITABLE -"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//select')
      puts"The - #{field_name} - field is -  EDITABLE -"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]')
      writeFailure"The - #{field_name} - field is -  NON EDITABLE -"
    else
      writeFailure "The field - #{field_name} - is not present over the page"
    end
    step 'I click Save button from top button row'
    Capybara.default_wait_time =30
  end
end

# Verify a section over page
Then(/^I should not see the "([^"]*)" section over the page$/) do |section_Name|
  sleep 5
  if page.has_xpath?('//h3[text()="'"#{section_Name}"'"]')
    writeFailure "The section - #{section_Name} - is present over the page"
    sleep 5
  else
    puts "The section - #{section_Name} - is NOT present over the page"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
end

# Verify a section over page
Then(/^I should see the "([^"]*)" section over the page$/) do |section_Name|
  sleep 5
  if page.has_xpath?('//h3[text()="'"#{section_Name}"'"]')
    puts "The section - #{section_Name} - is present over the page"
    sleep 5
  else
    writeFailure "The section - #{section_Name} - is NOT present over the page"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
end

# Verify the table column under given section
Then(/^I should see the "([^"]*)" column in "([^"]*)" section$/) do |column_name, section_name|
  sleep 5
  if page.has_xpath?('//th[text()="'"#{column_name}"'"]/ancestor::div[1]/preceding-sibling::div[1]//h3[text()="'"#{section_name}"'"]')
    puts "The column - #{column_name} - is present over the page under #{section_name} section"
    sleep 5
  else
    writeFailure "The column - #{column_name} - is NOT present over the page under #{section_name} section"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
end

# Verify a section over page
Then(/^I should see the "([^"]*)" as multiselect picklist$/) do |picklist_name|
  step 'I click Edit button from top button row'
  sleep 5
  #if page.has_xpath?('//label[text()="'"#{picklist_name}"'"]/parent::td[1]/following-sibling::td[1]/span/select[@multiple="multiple"]')
  if page.has_xpath?('//label[text()="'"#{picklist_name}"'"]/parent::td[1]/following-sibling::td[1]/table')
    puts "The field - #{picklist_name} - is multiple selection dropdown field"
  elsif page.has_xpath?('//td[text()="'"#{picklist_name}"'"]')
    writeFailure "The MultiSelectPicklist - #{picklist_name} -is appearing with - R Permission -"
  else
    writeFailure "The picklist - #{picklist_name} - is NOT present as multiselect picklist"
    #fail(ArgumentError.new('fail to click Cancel button'))
  end
  step 'I click Save button from top button row'
end

Then(/^I should see the "([^"]*)" as picklist type$/) do |picklist_name|
  step 'I click Edit button from top button row'
  sleep 5
  if page.has_xpath?('//label[text()="'"#{picklist_name}"'"]/parent::td[1]/following-sibling::td[1]/span/select')
    if page.has_xpath?('//label[text()="'"#{picklist_name}"'"]/parent::td[1]/following-sibling::td[1]/table')
      writeFailure "The field - #{picklist_name} - is multiple selection dropdown field"
    else
      puts "The field - #{picklist_name} - is single selection dropdown field"
    end
  else
    writeFailure "The section - #{picklist_name} - is NOT present as picklist type"
    #fail(ArgumentError.new('fail'))
  end
  step 'I click Save button from top button row'
end

# Verify the section over the page
Then(/^I should see "([^"]*)" section over "([^"]*)" detail page$/) do |section_name, pageName|
  sleep 5
  if page.has_xpath?('//h3[text()="'"#{section_name}"'"]')
    puts "The section - #{section_name} - is present over the #{pageName} detail page"
    sleep 5
  else
    writeFailure "The section - #{section_name} - is NOT present over the #{pageName} detail page"
    #fail(ArgumentError.new('Fail'))
  end
end

# Verify the section over the page
Then(/^I should see the "([^"]*)" section under "([^"]*)" section$/) do |section_name1, sectionName_2|
  sleep 5
  if page.has_xpath?('//h3[text()="'"#{sectionName_2}"'"]/ancestor::div[@class="bRelatedList"]/following-sibling::div[1]//h3[text()="'"#{section_name1}"'"]')
    puts "The section - #{section_name1} - is present under - #{sectionName_2} - section"
    sleep 5
  else
    writeFailure "The section - #{section_name1} - is NOT present under - #{sectionName_2} - section"
    #fail(ArgumentError.new('Fail'))
  end
end

# select option from user menu
Then(/^I selected "([^"]*)" from user menu$/) do |option|
  sleep 5
  if page.has_xpath?('//div[@id="userNav-arrow"]')
    find(:xpath, '//div[@id="userNav-arrow"]').click
    sleep 5
  else
    writeFailure "Fail to click user menu"
    #fail(ArgumentError.new('Fail'))
  end
  if page.has_xpath?('(//a[@title="'"#{option}"'"])[1]')
    find(:xpath, '(//a[@title="'"#{option}"'"])[1]').click
    sleep 5
  else
    writeFailure "Fail to select #{option} option from user menu"
    #fail(ArgumentError.new('Fail'))
  end
end

# click a link present under App Setup
Then(/^I clicked the "([^"]*)" link under "([^"]*)"$/) do |link_text, header_name|
  sleep 5
  #within(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div')do
  if page.has_xpath?('//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div//a[text()="'"#{link_text}"'"]')
    find(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div//a[text()="'"#{link_text}"'"]').click
    puts "The - #{link_text} - link has been clicked"
    sleep 5
  else
    writeFailure "Fail to click - #{link_text} - link"
    #fail(ArgumentError.new('Fail'))
  end
end
#end

# click a link present under App Setup
Then(/^I click "([^"]*)" link under "([^"]*)"$/) do |link_text, header_name|
  sleep 5
  #within(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]//div')do
  if page.has_xpath?('//a[text()="'"#{header_name}"'"]/parent::div[1]//a[text()="'"#{link_text}"'"]')
    find(:xpath, '//a[text()="'"#{header_name}"'"]/parent::div[1]//a[text()="'"#{link_text}"'"]').click
    puts "The - #{link_text} - link has been clicked"
    sleep 5
  else
    writeFailure "Fail to click - #{link_text} - link"
    #fail(ArgumentError.new('Fail'))
  end
end
#end

# Verify if the checkbox is enabled for the fields
Then(/^I should see that track history has been enabled for "([^"]*)" field$/) do |fieldName|
  sleep 5
  if page.has_xpath?('//a[text()="'"#{fieldName}"'"]/ancestor::th/following-sibling::td/img[@title="Checked"]')
    puts "The track history has been enabled for - #{fieldName} - field"
    sleep 5
  elsif page.has_xpath?('//a[text()="'"#{fieldName}"'"]/ancestor::th/following-sibling::td/img[@title="Not Checked"]')
    writeFailure "The track history has - NOT - been enabled for - #{fieldName} - field"
    #fail(ArgumentError.new('Fail'))
    sleep 5
  else
    writeFailure "Fail to verify track history status for - #{fieldName}"
    #fail(ArgumentError.new('Fail'))
  end
end


# Verify options under given dropdown
Then(/^I should see the  "([^"]*)" under "([^"]*)" dropdown$/) do |option, dropdown_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//option[text()="'"#{option}"'"]')
    puts "The option - #{option} - is present under - #{dropdown_name} - dropdown"
  else
    if page.has_xpath?('(//label[text()="AMP Inhibitors"]/ancestor::td[1]/following-sibling::td[1]//select)[1]')
      writeFailure "The option - #{option} - is NOT present under - #{dropdown_name} - dropdown"
      #fail(ArgumentError.new('Fail'))
    else
      if page.has_xpath?('//td[text()="'"#{dropdown_name}"'"]')
        writeFailure "The DROPDOWN - #{dropdown_name} - is present over the page with - READ ONLY - permission"
        #fail(ArgumentError.new('Fail'))
      else
        writeFailure "The DROPDOWN - #{dropdown_name} - is NOT present over the page"
        #fail(ArgumentError.new('Fail'))
      end

    end
  end
  Capybara.default_wait_time =30
end

# Verify options not present under given dropdown
Then(/^I should not see the option "([^"]*)" under "([^"]*)" dropdown$/) do |option, dropdown_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{dropdown_name}"'"]/ancestor::td[1]/following-sibling::td[1]//option[text()="'"#{option}"'"]')
    writeFailure "The option - #{option} - is present under - #{dropdown_name} - dropdown"
    #fail(ArgumentError.new('Fail'))
  else
    if page.has_xpath?('//td[text()="'"#{dropdown_name}"'"]')
      writeFailure "The DROPDOWN - #{dropdown_name} - is present over the page with - READ ONLY - permission"
      #fail(ArgumentError.new('Fail'))
    else
      puts "The option - #{option} - is NOT present under - #{dropdown_name} - dropdown"
    end
    Capybara.default_wait_time =30
  end
end

# Verify if the field is first field in the right column under given section
Then(/^I should see the field "([^"]*)" as the first item in the right column$/) do |dropdown_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[text()="'"#{dropdown_name}"'"]/preceding-sibling::td[3]')
    writeFailure "The field  - #{dropdown_name} - is not the first item in the right column"
    #fail(ArgumentError.new('Fail'))
  else
    puts "The field  - #{dropdown_name} - is the first item in the right column"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with Read only permission
Then(/^I should see the field "([^"]*)" with - Read Only - permission$/) do |field_name|
  sleep 5

  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*[self::select or self::input]')
    writeFailure "The field  - #{field_name} - is not present with - READ ONLY - permission"
    #fail(ArgumentError.new('Fail'))
  else
    puts "The field  - #{field_name} - is present with - READ ONLY - permission"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" with - RW - permission$/) do |field_name|

  step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =10
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*[self::select or self::input]')
    puts "The field  - #{field_name} - is present with - RW - permission"
  else
    writeFailure "The field  - #{field_name} - is not present with - RW - permission"
    #fail(ArgumentError.new('Fail'))
  end
  step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

# Verify if the field is present under account detail section
Then(/^I should see the field "([^"]*)" under Account Detail section$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//h2[text()="Account Detail"]/ancestor::div[1]/following-sibling::div[1]/div[3]//td[text()="'"#{field_name}"'"]')
    puts "The field  - #{field_name} - is present under account detail section"
  else
    writeFailure "The field  - #{field_name} - is not present under account detail section"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# Verify AMP Achieved Outcomes field as multiselect field
Then(/^I should see the AMP Achieved Outcomes as multiselect picklist$/) do
  step 'I click Edit button from top button row'
  sleep 5
  if (ENV['UserRole']=="nalasalesrepsit" or ENV['UserRole']=="nalasalesmgrsit" or ENV['UserRole']=="Admin")
    if page.has_xpath?('//label[text()="AMP Achieved Outcomes"]/parent::td[1]/following-sibling::td[1]/table')
      puts "The field - AMP Achieved Outcomes - is multiple selection dropdown field"
    elsif page.has_xpath?('//td[text()="AMP Achieved Outcomes"]')
      writeFailure "The MultiSelectPicklist - AMP Achieved Outcomes -is appearing with - R Permission -"
    else
      writeFailure "The picklist - AMP Achieved Outcomes - is NOT present as multiselect picklist"
      #fail(ArgumentError.new('fail to click Cancel button'))
    end
  elsif (ENV['UserRole']=="nalaopsrepsit" or ENV['UserRole']=="nalaopsmgrsit")
    if page.has_xpath?('//label[text()="AMP Achieved Outcomes"]/parent::td[1]/following-sibling::td[1]/table')
      writeFailure "The field - AMP Achieved Outcomes - is multiple selection dropdown field"
      #fail(ArgumentError.new('Fail'))
    elsif page.has_xpath?('//td[text()="AMP Achieved Outcomes"]')
      puts "The MultiSelectPicklist - AMP Achieved Outcomes -is appearing with - R Permission -"
    else
      writeFailure "The picklist - AMP Achieved Outcomes - is NOT present as multiselect picklist"
      #fail(ArgumentError.new('fail to click Cancel button'))
    end
  end
  step 'I click Save button from top button row'
end


#Step to verify the AMP Achieved Outcomes drop down options appearing against requirement
Then(/^I should see AMP Achieved Outcomes field MultiSelectPicklist options$/) do
  sleep 5
  begin
    if (ENV['UserRole']=="nalasalesrepsit" or ENV['UserRole']=="nalasalesmgrsit" or ENV['UserRole']=="Admin")
      step 'I click Edit button from top button row'
      arg=getDetails "CommonData"
      resultArray=[]
      expectedArrayOption=[]
      actualArrayOption=[]
      expectedArrayOption=arg["AMP Achieved Outcomes"]
      if page.has_xpath?('//select[contains(@title,"AMP Achieved Outcomes - Available")]')
        actualArrayOption=find(:xpath, '//select[contains(@title,"AMP Achieved Outcomes - Available")]').all('option').collect(&:text)
      elsif  page.has_xpath?('//td[text()="AMP Achieved Outcomes"]')
        writeFailure "The MultiSelectPicklist - AMP Achieved Outcomes - is appearing with - R Permission -"
        step 'I click Save button from top button row'
        next
      elsif page.has_no_xpath?('//td[text()="AMP Achieved Outcomes"]') and page.has_no_xpath?('//label[text()="AMP Achieved Outcomes"]')
        writeFailure "The MultiSelect Picklist - AMP Achieved Outcomes - is NOT present over the page"
        step 'I click Save button from top button row'
        next
      end
      resultArray=expectedArrayOption.sort-actualArrayOption.sort
      if resultArray.count==0
        puts "The expected options for the dropdown - AMP Achieved Outcomes - is present"
      else
        writeFailure "The following options are not present in the dropdown"
        writeFailure resultArray
      end
      resultArray=actualArrayOption.sort-expectedArrayOption.sort
      if resultArray.count!=0
        writeFailure "The following extra option are appearing in the dropdown"
        writeFailure resultArray
      end
      step 'I click Save button from top button row'
      sleep 5
    elsif (ENV['UserRole']=="nalaopsrepsit" or ENV['UserRole']=="nalaopsmgrsit")
      if page.has_xpath?('//label[text()="AMP Achieved Outcomes"]/parent::td[1]/following-sibling::td[1]/table')
        writeFailure "The field - AMP Achieved Outcomes - is multiple selection dropdown field"
        #fail(ArgumentError.new('Fail'))
      elsif page.has_xpath?('//td[text()="AMP Achieved Outcomes"]')
        puts "The MultiSelectPicklist - AMP Achieved Outcomes -is appearing with - R Permission -"
      else
        writeFailure "The picklist - AMP Achieved Outcomes - is NOT present as multiselect picklist"
        #fail(ArgumentError.new('fail to click Cancel button'))
      end
    end
  rescue Exception => ex
    step 'I click Save button from top button row'
    writeFailure "Error while verifying - AMP Achieved Outcomes - MultiSelectPicklist option"
    writeFailure ex.message

  end
end


# Verify Visualforce page under CSM section
Then(/^I should see the Visualforce page under CSM section$/) do
  sleep 7
  if page.has_xpath?('//iframe[@title="CSM_SuccessPlanDetails"]')
    puts " The - Visualforce page - is present under - CSM - section"
  else
    writeFailure "The - Visualforce page - is NOT present under - CSM - section"
    #fail(ArgumentError.new('fail'))
  end
  Capybara.default_wait_time =1
  #within(:xpath, '(//h3[text()="CSM"]/parent::div[1]/following-sibling::div[1]//table)[1]')do

  #  within_frame('06636000003TBCA') do
  #    within_frame(find('iframe[title="CSM_SuccessPlanDetails"]')) do
  #      if page.has_xpath?('//th[text()="Success Plan Template"]')
  #        puts " The - Visualforce page - is present under - CSM - section"
  #      else
  #        writeFailure "The - Visualforce page - is NOT present under - CSM - section"
  #fail(ArgumentError.new('fail'))
  #      end
  #    end
  #  end
  Capybara.default_wait_time =30
end

# Verify the column headings

Then(/^I should see "([^"]*)" column under "([^"]*)" section$/) do |column_name, section_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//h3[text()="'"#{section_name}"'"]/ancestor::div[contains(@class,"listRelatedObject")][1]//th[text()="'"#{column_name}"'"]')
    puts "The coulmn name - #{column_name} - is present under section - #{section_name} -"
  else
    writeFailure "The coulmn name - #{column_name} - is - NOT -present under section - #{section_name} -"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

Then(/^I should see "([^"]*)" as 4th column in the "([^"]*)" table$/) do |column_name, section_name|
  sleep 5
  Capybara.default_wait_time =1
  temp_var=""
  if find(:xpath, '//h3[text()="'"#{section_name}"'"]/ancestor::div[contains(@class,"listRelatedObject")][1]//th[4]').text == column_name
    puts "The column - #{column_name} - is appearing at second place"
  else
    temp_var=find(:xpath, '//h3[text()="'"#{section_name}"'"]/ancestor::div[contains(@class,"listRelatedObject")][1]//th[4]').text
    writeFailure "The column - #{temp_var} - is appearing rather than column - #{column_name} - at second place"
  end
  Capybara.default_wait_time =30
end

Then(/^I should see "([^"]*)" as third column in the "([^"]*)" table$/) do |column_name, section_name|
  sleep 5
  Capybara.default_wait_time =1
  temp_var=""
  if find(:xpath, '//h3[text()="'"#{section_name}"'"]/ancestor::div[contains(@class,"listRelatedObject")][1]//th[3]').text == column_name
    puts "The column - #{column_name} - is appearing at third place"
  else
    temp_var=find(:xpath, '//h3[text()="'"#{section_name}"'"]/ancestor::div[contains(@class,"listRelatedObject")][1]//th[3]').text
    writeFailure "The column - #{temp_var} - is appearing rather than column - #{column_name} - at third place"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" with RW permission$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//*)[1]')
    puts "The field  - #{field_name} - is present with - RW - permission"
  elsif page.has_xpath?('(//label[text()="'"#{field_name}"'"]/ancestor::td[1]/following-sibling::td[1]//a)[1]')
    puts "The field  - #{field_name} - is present with - RW - permission"
  else
    writeFailure "The field  - #{field_name} - is not present with - RW - permission"
    #fail(ArgumentError.new('Fail'))
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with RW permission
Then(/^I should not see new button under case section$/) do
  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//div[contains(@class,"caseBlock")]//input[contains(@title,"New") and @class="btn"]')
    writeFailure "The New button is present under case section"
  else
    puts "The New button is - NOT -present under case section"
    #fail(ArgumentError.new('Fail'))
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

# Verify error message over the page
Then(/^I click the button "([^"]*)" over the page$/) do |button_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//input[@class="btn" and @title="'"#{button_name}"'"]')
    find(:xpath, '//input[@class="btn" and @title="'"#{button_name}"'"]').click
    puts "The button - #{button_name} - has been clicked"
    sleep 7
  else
    writeFailure "The button - #{button_name} - is not present over the page"
  end
  Capybara.default_wait_time =30
end

Then(/^I enter "([^"]*)" in "([^"]*)" field$/) do |field_value, field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input[@type="text"]')
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input[@type="text"]').set field_value
  else
    writeFailure "Fail to enter data in --- #{field_name} -- field "
  end
  Capybara.default_wait_time =30
end

Then(/^I enter data in "([^"]*)" field$/) do |field_name|
  sleep 5
  Capybara.default_wait_time =1
  data="smoke Test-Contact_"+Random.new.rand(111..9999).to_s
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input[@type="text"]')
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//input[@type="text"]').set data
  else
    writeFailure "Fail to enter data in --- #{field_name} -- field "
  end
  Capybara.default_wait_time =30
end

Then(/^I select "([^"]*)" from "([^"]*)" picklist$/) do |option, field_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//select')
    find(:xpath, '//label[text()="'"#{field_name}"'"]/parent::td[1]/following-sibling::td[1]//select').select option
    puts "The option -- #{option} -- is selected from -- #{field_name} -- dropdown"
  else
    writeFailure "Fail to enter data in --- #{field_name} -- dropdown "
  end
  Capybara.default_wait_time =30
end

#Then(/^I select BDM from Role picklist$/) do
#  sleep 5
#  if page.has_xpath?('//label[text()="Role"]/parent::td[1]/following-sibling::td[1]//select')
#    find(:xpath, '//label[text()="Role"]/parent::td[1]/following-sibling::td[1]//select').set option
#  else
#    writeFailure "Fail to enter data in --- #{field_name} -- dropdown "
#  end
#end

Then(/^I should see the error message "([^"]*)"$/) do |error_msg|
  sleep 5
  if has_text?(error_msg)
    puts "The error message --  #{error_msg} -- is present over the page"
  else
    writeFailure "The error message --  #{error_msg} -- is not present over the page"
  end
end

Then(/^The contact should save$/) do
  sleep 5
  Capybara.default_wait_time =30
  if page.has_xpath?('//input[@class="btn" and @title="Edit"]')
    puts " The record saved successfully"
  else
    writeFailure "Fail to save the record "
  end
  Capybara.default_wait_time =30
end


Then(/^I select existing Contacts record$/) do

  if page.has_xpath?('//tr[contains(@class,"dataRow even first")]//th//a')
    #find(:xpath, '//select[@title="View:"]').select "All"
    find(:xpath, '//tr[contains(@class,"dataRow even first")]//th//a').click
  elsif page.has_xpath?('//select[@title="View:"]')
    #find(:xpath, '//select[@title="View:"]').select "All"
    find(:xpath, '//select[@title="View:"]//option[text()="All Contacts"][1]').select_option
    sleep 5
    if page.has_xpath?('//input[@class="btn" and @title="Go!"]')
      sleep 2
      find(:xpath, '//input[@class="btn" and @title="Go!"]').click
    end
    sleep 5
    if page.has_xpath?('(//td[contains(@class,"FULL_NAME")]//a)[2]')
      find(:xpath, '(//td[contains(@class,"FULL_NAME")]//a)[2]').click
    else
      writeFailure"NO RECORD FOUND IN Contacts TAB"
    end
  end
end


# click a link present under App Setup
Then(/^I should see Currency Code "([^"]*)"$/) do |currency_Code|
  sleep 5
  #  Capybara.default_wait_time =1
  #  if page.has_xpath?('//th[text()="Currency Code"]/parent::tr[1]/following-sibling::tr/th[text()="'"#{currency_Code}"'"]')
  #    puts "The Currency Code - #{currency_Code} - is presennt over the page"
  #    sleep 5
  #  else
  #    writeFailure "The Currency Code - #{currency_Code} - is not presennt over the page"
  #    #fail(ArgumentError.new('Fail'))
  #  end
  #  Capybara.default_wait_time =30
  if page.has_content? currency_Code
    puts "#{currency_Code} currency code is present"
  else
    writeFailure "#{currency_Code} currency code is not present"
  end 
end

# click a link present under App Setup
Then(/^I clicked the link "([^"]*)"$/) do |currency_Code|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{currency_Code}"'"]')
    find(:xpath, '//a[text()="'"#{currency_Code}"'"]').click
    puts "The link #{currency_Code} has been clicked"
    sleep 5
  else
    writeFailure "FAIL to click the link #{currency_Code}"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end


# click a link present under App Setup
Then(/^I should see "([^"]*)" as "([^"]*)"$/) do |day_Name, hours|
  sleep 5
  Capybara.default_wait_time =30
  if page.has_xpath?('//label[text()="'"#{day_Name}"'"]/parent::td[1]/following-sibling::td[text()="'"#{hours}"'"]')
    puts "The day name - #{day_Name} - is showing value as -- #{hours}--"
    sleep 5
  else
    writeFailure "The day name - #{day_Name} - is NOT showing value as -- #{hours}--"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# click a link present under App Setup
Then(/^I should see "([^"]*)" as "([^"]*)" and "([^"]*)" and "([^"]*)"$/) do |day_Name, start_hours, to, end_hours|
  sleep 5
  Capybara.default_wait_time =30
  if page.has_xpath?('//label[text()="'"#{day_Name}"'"]/parent::td[1]/following-sibling::td[text()="'"#{start_hours}"'"]/following-sibling::td[text()="'"#{to}"'"]/following-sibling::td[text()="'"#{end_hours}"'"]')
    puts "The day name - #{day_Name} - is showing value as -- #{start_hours} #{to} #{end_hours}--"
    sleep 5
  else
    writeFailure "The day name - #{day_Name} - is NOT showing value as -- #{start_hours} #{to} #{end_hours}--"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

## click a link present under App Setup
#Then(/^I clicked the "([^"]*)" link under "([^"]*)"$/) do |link_text, header_name|
#
#  sleep 5
#  Capybara.default_wait_time =1
#  if page.has_xpath?('//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div[1]//a[text()="'"#{link_text}"'"]')
#    find(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div[1]//a[text()="'"#{link_text}"'"]').click
#    puts "The - #{link_text} - link has been clicked"
#    sleep 5
#  else
#    writeFailure "Fail to click - #{link_text} - link"
#fail(ArgumentError.new('Fail'))
#  end
#  Capybara.default_wait_time =30
#end


# click a link present under App Setup
Then(/^I should see "([^"]*)" active checkbox unchecked$/) do |checkBox_name|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{checkBox_name}"'"]/ancestor::tr[1]//img[@title="Not Checked"]')
    find(:xpath, '//a[text()="'"#{checkBox_name}"'"]/ancestor::tr[1]//img[@title="Not Checked"]').click
    puts "The checkbox - #{checkBox_name} - is not checked"
    sleep 5
  else
    writeFailure "The checkbox - #{checkBox_name} - is checked"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

Then(/^I should verify users$/) do
  begin
    sleep 5
    arg=getGeneralDetails 'Users'
    excelsheet= WIN32OLE.new('excel.application')
    wrkbook= excelsheet.Workbooks.Open(arg["File_Path"])
    wrksheet= wrkbook.Worksheets(arg["Sheetname"])
    wrksheet.Select

    i=arg["Start_Row"]
    puts "----------------------------------------------------------------------------------------"
    #puts wrksheet.UsedRange.Rows.Count
    Capybara.default_wait_time =1
    for counter in i..wrksheet.UsedRange.Rows.Count

      lastName=arg["LastName"]+i.to_s
      lastName=wrksheet.Range(lastName).Value
      if lastName.nil?
        writeFailure "LastName -- is not found under cell --- #{arg["LastName"]+i.to_s}"
      else
        lastName=lastName.strip
      end

      firstName=arg["FirstName"]+i.to_s
      firstName=wrksheet.Range(firstName).Value
      if firstName.nil?
        writeFailure "FirstName -- is not found under cell --- #{arg["FirstName"]+i.to_s}"
      else
        firstName=firstName.strip
      end

      userName=arg["UserName"]+i.to_s
      userName=wrksheet.Range(userName).Value
      if userName.nil?
        writeFailure "FirstName -- is not found under cell --- #{arg["UserName"]+i.to_s}"
      else
        userName=userName.strip
      end

      persona=arg["Persona"]+i.to_s
      persona=wrksheet.Range(persona).Value
      if persona.nil? == false
        persona=persona.strip
      end

      userStatus=arg["UserStatus"]+i.to_s
      userStatus=wrksheet.Range(userStatus).Value
      if userStatus.nil?
        writeFailure "UserStatus -- is not found under cell --- #{arg["UserStatus"]+i.to_s}"
      else
        userStatus=userStatus.strip
      end

      username1=lastName+", "+firstName
      name_filter=lastName.to_s.chars.first


      if page.has_xpath?('//span[text()="'"#{name_filter}"'" and (@class="listItemSelected" or @class="listItemPad")]')
        find(:xpath, '(//span[text()="'"#{name_filter}"'" and (@class="listItemSelected" or @class="listItemPad")])[1]').click
      end

      if userStatus=="Active"
        if page.has_xpath?('//a[text()="'"#{username1}"'"]/ancestor::tr[1]//td[3]/a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//td[5]/a[text()="'"#{persona}"'"]/ancestor::tr[1]//td[6]/img[@title="Checked"]')
          puts "The user name #{} is present with last name as -#{lastName}- first name as - #{firstName} -  role as -#{persona}- and active status as -#{userStatus}"
        else
          if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]')
            if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//th[1]/a[contains(text(),"'"#{firstName}"'")]')
              puts "The first name is present as -#{firstName}"
            else
              writeFailure "The first name is not present as -#{firstName} - for user -#{userName}"
            end
            if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//th[1]/a[contains(text(),"'"#{lastName}"'")]')
              puts "The last name is present as -#{lastName}"
            else
              writeFailure "The last name is not present as -#{lastName} - for user -#{userName}"
            end
            if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//td[5]/a[text()="'"#{persona}"'"]')
              puts "The user role is present as -#{persona}"
            elsif persona.nil? == true
              writeFailure "No User role found for user -#{userName}"
            else
              writeFailure "The user role is not present as - #{persona} - for user -#{userName}"
            end
            if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//td[6]/img[@title="Checked"]')
              puts "The user status is present as -#{userStatus}"
            else
              writeFailure "The user status is not present as -#{userStatus} for user -#{userName}"
            end
          else
            writeFailure "The user name - #{userName}- is not found"
          end
        end
      elsif userStatus=="Inactive"
        if page.has_xpath?('//a[text()="'"#{username1}"'"]/ancestor::tr[1]//td[3]/a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//td[6]/img[@title="Not Checked"]')
          puts "The user name #{} is present with last name as -#{lastName}- first name as - #{firstName} - and active status as -#{userStatus}"
        else
          if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]')
            if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//th[1]/a[contains(text(),"'"#{firstName}"'")]')
              puts "The first name is present as -#{firstName}"
            else
              writeFailure "The first name is not present as -#{firstName} for user -#{userName}"
            end
            if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//th[1]/a[contains(text(),"'"#{lastName}"'")]')
              puts "The last name is present as -#{lastName}"
            else
              writeFailure "The last name is not present as -#{lastName} for user -#{userName}"
            end
            if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//td[6]/img[@title="Not Checked"]')
              puts "The user status is present as -#{userStatus}"
            else
              writeFailure "The user status is not present as -#{userStatus} for user -#{userName}"
            end
          else
            writeFailure "The user name - #{userName}- is not found"
          end
        end
      else
        writeFailure "There is no status found and hence fail to check the record"
      end
      puts "----------------------------------------------------------------------------------------"

      i=i+1
    end
    excelsheet.Quit();
    Capybara.default_wait_time =30
  end
end