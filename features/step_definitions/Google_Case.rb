When(/^I check the picklist value of record type of new record for sales mgr and slaes rep$/) do
  sleep 3
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Booking Request']")
    puts "Record Type of new record picklist contains Booking Request option"
  else
    writeFailure "Record Type of new record picklist does not contain Booking Request option"
  end
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Data Processing Request']")
    puts "Record Type of new record picklist contains Data Processing Request option"
  else
    writeFailure "Record Type of new record picklist does not contain Data Processing Request"
  end
  sleep 2
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Data Update Request']")
    puts "Record Type of new record picklist contains Data Update Request option"
  else
    writeFailure "Record Type of new record picklist does not contain Data Update Request option"
  end
  sleep 2
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Lead Submission']")
    puts "Record Type of new record picklist contains Lead Submission option"
  else
    writeFailure "Record Type of new record picklist does not contain Lead Submission option"
  end
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Quote Request']")
    puts "Record Type of new record picklist contains Quote Request option"
  else
    writeFailure "Record Type of new record picklist does not contain Quote Request option"
  end
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Reporting Request']")
    puts "Record Type of new record picklist contains Reporting Request option"
  else
    writeFailure "Record Type of new record picklist does not contain Reporting Request option"
  end
end

Given(/^I should navigate to Cases tab in saleforce application$/) do
  step 'I enter the credentials to the Zenith application'
  sleep 10
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 5
  find(:xpath,"//a[@class='listRelatedObject caseBlock title']").click
  sleep 5
end

When(/^I check the picklist value of record type of new record for ops mgr and ops rep$/) do
  sleep 3
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Booking Request']")
    puts "Record Type of new record picklist contains Booking Request option"
  else
    writeFailure "Record Type of new record picklist does not contain Booking Request option"
  end
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Data Processing Request']")
    puts "Record Type of new record picklist contains Data Processing Request option"
  else
    writeFailure "Record Type of new record picklist does not contain Data Processing Request"
  end
  sleep 2
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Data Update Request']")
    puts "Record Type of new record picklist contains Data Update Request option"
  else
    writeFailure "Record Type of new record picklist does not contain Data Update Request option"
  end
  sleep 2
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Quote Request']")
    puts "Record Type of new record picklist contains Quote Request option"
  else
    writeFailure "Record Type of new record picklist does not contain Quote Request option"
  end
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Reporting Request']")
    puts "Record Type of new record picklist contains Reporting Request option"
  else
    writeFailure "Record Type of new record picklist does not contain Reporting Request option"
  end
end

When(/^I check that case record type field shows lead submission$/) do
  #  if page.has_xpath?('//label[text()="Case Record Type"]/following-sibling::td[1]/*[contains(text()="Lead Submission")]')
  #  end

  #//td[text()="Task Record Type"]/following-sibling::td[1][text()="Task - Email"]
  #if page.has_xpath?('//td[text()="Case Record Type"]/following-sibling::td[1][text()="Lead Submission"]')
  if page.has_xpath?('//tr[td[label[contains(.,"Case Record Type")]]]/td[2][contains(.,"Lead Submission")]')
    puts "case record type field shows lead submission"
  else
    writeFailure "case record type field does not shows lead submission option"
  end
end

When(/^I enter the mandatory field values under new case for lead submission$/) do
  if page.has_field?("Status")
    select("New", :from => "Status")
  end
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Contact Name Lookup (New Window)']").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-contact-")
  sleep 10
  find_button('Go!').click
  sleep 20
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  if page.has_field?("Description")
    fill_in("Description",:with=> "testing")
  end
  if page.has_field?("Product(s) That Needs To Be Quoted")
    fill_in("Product(s) That Needs To Be Quoted",:with=> "testing")
  end
  if page.has_field?("Applicable Discounts")
    fill_in("Applicable Discounts",:with=> "testing")
  end
  if page.has_field?("New Term Dates")
    fill_in("New Term Dates",:with=> "testing")
  end
end

Then(/^I check that case record type field shows "([^"]*)"$/) do |value|
  if page.has_xpath?('//tr[td[label[contains(.,"Case Record Type")]]]/td[2][contains(.,"'"#{value}"'")]')
    #[contains(.,"Case Record Type")]- ., means value or text or any thing
    puts "case record type field shows Data Update Request option"
  else
    writeFailure "case record type field does not shows Data Update Request option"
  end
end

#Then(/^I select high option from priority picklist$/) do
#  if page.has_field?("Priority")
#    select("High", :from => "Priority")
#  end
#end

Then(/^I select "([^"]*)" option from "([^"]*)" picklist$/) do |option_val, field_val|
  if page.has_field?(field_val)
    select(option_val, :from => field_val)
  end
end

When(/^I enter the mandatory field values under new case for data update request$/) do
  if page.has_field?("Status")
    select("New", :from => "Status")
  end
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Opportunity Lookup (New Window)']").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-opportunity")
  sleep 10
  find_button('Go!').click
  sleep 10
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 5

  
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Contact Name Lookup (New Window)']").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-contact-")
  sleep 10
  find_button('Go!').click
  sleep 10
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 3
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 3

  if page.has_field?("Description")
    fill_in("Description",:with=> "testing")
  end
  if page.has_field?("Product(s) That Needs To Be Quoted")
    fill_in("Product(s) That Needs To Be Quoted",:with=> "testing")
  end
  if page.has_field?("Applicable Discounts")
    fill_in("Applicable Discounts",:with=> "testing")
  end
  if page.has_field?("New Term Dates")
    fill_in("New Term Dates",:with=> "testing")
  end
end

Then(/^I check case milestone and target date value for date update request$/) do
    sleep 5
    #within all('.pbBody')[8] do
    within all('.pbBody')[5] do    
      table=all("tbody")[0]      
      sleep 5
      puts table.all('tr')[1].all('th')[0].all('a')[0].text.to_s
      @actual_time_remaining = "720"
      @existing_time_remaining = table.all('tr')[1].all('td')[4].text
      puts "actual time remaining should be: #{@actual_time_remaining}"
      puts "existing time remaining is : #{@existing_time_remaining}"
      if @actual_time_remaining.to_s == @existing_time_remaining.to_s
        puts "Case Milestone is equal to 720 mins"
      else
        writeFailure "Case Milestone is not equal to 720 mins"
      end
      @@target_date = table.all('tr')[1].all('td')[2].text.to_s
      puts "Target Date is #{@@target_date}"
    end
    sleep 2
    within all('.pbSubsection')[3] do      
      table=all("tbody")[0]      
      sleep 5
      @@entitlement_process_start_time = table.all('tr')[0].all('td')[1].text.to_s
      puts "Entitlement Process Start Time field value is: #{@@entitlement_process_start_time}"
#      @@target_date_1 = @@target_date[0..-3]
#      puts "target_date_1: #{@@target_date_1}"
#      @@target_date_2 = @@target_date[-2..-1]
#      puts "target_date_2: #@@target_date_2"
#      @@entitlement_process_start_time_1 = @@entitlement_process_start_time[0..-3]
#      puts "@@entitlement_process_start_time_1: #{@@entitlement_process_start_time_1}"
#      @@entitlement_process_start_time_2 = @@entitlement_process_start_time[-2..-1]
#      puts "@@entitlement_process_start_time_2: #{@@entitlement_process_start_time_2}"
#      if (@@target_date_1 == @@entitlement_process_start_time_1) && (@@target_date_2 != @@entitlement_process_start_time_2)
#        puts "difference between Entitlement Process Start Time and Target Date is 12hrs (Business Hrs)"
#      else
#        writeFailure"difference between Entitlement Process Start Time and Target Date is not 12hrs (Business Hrs)"
#      end
    end
end

  Then(/^I check case milestone and target date value for quote request$/) do
    sleep 5
    #within all('.pbBody')[8] do
    within all('.pbBody')[5] do      
      table=all("tbody")[0]      
      sleep 5
      puts table.all('tr')[1].all('th')[0].all('a')[0].text.to_s
      @actual_time_remaining == "1440"
      @existing_time_remaining = table.all('tr')[1].all('td')[4].text
      puts "actual time remaining should be: #{@actual_time_remaining}"
      puts "existing time remaining is : #{@existing_time_remaining}"
      if @actual_time_remaining.to_s == @existing_time_remaining.to_s
        puts "Case Milestone is equal to 1440 mins"
      else
        writeFailure "Case Milestone is not equal to 1440 mins"
      end
      @@target_date = table.all('tr')[1].all('td')[2].text.to_s
      puts "Target Date is #{@@target_date}"
    end
#    sleep 2
#    within all('.pbSubsection')[3] do
#      table=all("tbody")[0]
#      sleep 5
#      @@entitlement_process_start_time = table.all('tr')[0].all('td')[1].text.to_s
#      puts "Entitlement Process Start Time field value is: #{@@entitlement_process_start_time}"
#      @@target_date_1 = @@target_date[0..-3]
#      puts "target_date_1: #{@@target_date_1}"
#      @@target_date_2 = @@target_date[-2..-1]
#      puts "target_date_2: #@@target_date_2"
#      @@entitlement_process_start_time_1 = @@entitlement_process_start_time[0..-3]
#      puts "@@entitlement_process_start_time_1: #{@@entitlement_process_start_time_1}"
#      @@entitlement_process_start_time_2 = @@entitlement_process_start_time[-2..-1]
#      puts "@@entitlement_process_start_time_2: #{@@entitlement_process_start_time_2}"
#      if (@@target_date_1 == @@entitlement_process_start_time_1) && (@@target_date_2 != @@entitlement_process_start_time_2)
#        puts "difference between Entitlement Process Start Time and Target Date is 12hrs (Business Hrs)"
#      else
#        writeFailure"difference between Entitlement Process Start Time and Target Date is not 24hrs (Business Hrs)"
#      end
#    end
end

Then(/^I check case milestone and target date value for booking request$/) do
     sleep 5
    #within all('.pbBody')[8] do
    within all('.pbBody')[5] do      
      table=all("tbody")[0]      
      sleep 5
      puts table.all('tr')[1].all('th')[0].all('a')[0].text.to_s
      @actual_time_remaining == "2880"
      @existing_time_remaining = table.all('tr')[1].all('td')[4]
      puts "actual time remaining should be: #{@actual_time_remaining}"
      puts "existing time remaining is : #{@existing_time_remaining}"
      if @actual_time_remaining.to_s == @existing_time_remaining.text.to_s
        puts "Case Milestone is equal to 2880 mins"
      else
        writeFailure "Case Milestone is not equal to 2880 mins"
      end
      @@target_date = table.all('tr')[1].all('td')[2].text.to_s
      puts "Target Date is #{@@target_date}"
    end
    sleep 2
    within all('.pbSubsection')[3] do
      table=all("tbody")[0]
      sleep 5
      @@entitlement_process_start_time = table.all('tr')[0].all('td')[1].text.to_s
      puts "Entitlement Process Start Time field value is: #{@@entitlement_process_start_time}"
#      @@target_date_1 = @@target_date[0..-3]
#      puts "target_date_1: #{@@target_date_1}"
#      @@target_date_2 = @@target_date[-2..-1]
#      puts "target_date_2: #@@target_date_2"
#      @@entitlement_process_start_time_1 = @@entitlement_process_start_time[0..-3]
#      puts "@@entitlement_process_start_time_1: #{@@entitlement_process_start_time_1}"
#      @@entitlement_process_start_time_2 = @@entitlement_process_start_time[-2..-1]
#      puts "@@entitlement_process_start_time_2: #{@@entitlement_process_start_time_2}"
#      if (@@target_date_1 == @@entitlement_process_start_time_1) && (@@target_date_2 != @@entitlement_process_start_time_2)
#        puts "difference between Entitlement Process Start Time and Target Date is 28hrs (Business Hrs)"
#      else
#        writeFailure"difference between Entitlement Process Start Time and Target Date is not 12hrs (Business Hrs)"
#      end
    end
end

  Given(/^I enter the mandatory field values under new case for quote request$/) do
    if page.has_field?("Status")
      select("New", :from => "Status")
    end
    if page.has_field?("Sub Case Type")
      select("New", :from => "Sub Case Type")
    end
    sleep 5
    # if page.has_field?("Opportunity")
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Opportunity Lookup (New Window)']").click
    sleep 25
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "smoke-test-opportunity-")
    sleep 5
    find_button('Go!').click
    sleep 20
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      sleep 5
      table.all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
    sleep 10
    #end

    sleep 5
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Contact Name Lookup (New Window)']").click
    sleep 25
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "smoke-test-contact-")
    sleep 5
    find_button('Go!').click
    sleep 10
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      sleep 5
      table.all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
    sleep 10

    if page.has_field?("Description")
      fill_in("Description",:with=> "testing")
    end
    if page.has_field?("Quote Type")
      select("1 Year", :from => "Quote Type")
    end
  end

  When(/^I check the picklist value of record type of new record under new case for sales ops$/) do
    sleep 2
    if page.has_xpath?("//select[@id='p3']/option[text() = 'Booking Request']")
      puts "Record Type of new record picklist contains Booking Request option"
    else
      writeFailure "Record Type of new record picklist does not contain Booking Request option"
    end
    if page.has_xpath?("//select[@id='p3']/option[text() = 'Data Update Request']")
      puts "Record Type of new record picklist contains Data Update Request option"
    else
      writeFailure "Record Type of new record picklist does not contain Data Update Request option"
    end
    if page.has_xpath?("//select[@id='p3']/option[text() = 'Reporting Request']")
      puts "Record Type of new record picklist contains Reporting Request option"
    else
      writeFailure "Record Type of new record picklist does not contain Reporting Request option"
    end
  end

  When(/^I enter the mandatory field values under new case for booking request$/)do
    if page.has_field?("Status")
      select("New", :from => "Status")
    end
    if page.has_field?("Sub Case Type")
      select("New", :from => "Sub Case Type")
    end
    sleep 5
    # if page.has_field?("Opportunity")
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Opportunity Lookup (New Window)']").click
    sleep 25
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "smoke-test-opportunity")
    sleep 5
    find_button('Go!').click
    sleep 10
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      sleep 5
      table.all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
    sleep 10
    #end

    sleep 5
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Contact Name Lookup (New Window)']").click
    sleep 25
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "smoke-test-contact")
    sleep 5
    find_button('Go!').click
    sleep 10
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      sleep 5
      table.all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
    sleep 10

    if page.has_field?("Description")
      fill_in("Description",:with=> "testing")
    end
    if page.has_field?("Contract Amount")
      fill_in("Contract Amount",:with=> "100")
    end
  end

  Then(/^I select "([^"]*)" from sub case type picklist under case information$/) do |value|
    select(value, :from => 'Sub Case Type')
  end

  When(/^I fill in description with "([^"]*)" under description information row$/) do |value|
    fill_in("Description",:with=> value)
  end

  Then(/^I select "([^"]*)" from ssi result reason$/) do |value|
    if page.has_field?("Renewal Status")
      select(value, :from => 'Renewal Status')
    else
      writeFailure "Renewal Status picklist is not visible"
    end
  end

  Then(/^I should get recently created case$/) do
    $newcreatedcase = find(:xpath,"//h2[@class='pageDescription']").text
    puts $newcreatedcase
  end


  Given(/^I should login as a "([^"]*)"$/) do |user_role|
    visit($BASE_URL)
    sleep 10
    if user_role == "opsmgrprod"
      fill_in "Username",:with => "google.opsmgr@servicesource.com.google"
      fill_in "Password",:with => "testgoogle123!"
      find(:id,"Login").click
      puts "Logged in successfully"
      sleep 3
    elsif user_role == "opsrepprod"
      fill_in "Username",:with => "google.opsrep@servicesource.com.google"
      fill_in "Password",:with => "testgoogle123!"
      find(:id,"Login").click
      puts "Logged in successfully"
      sleep 3
    elsif user_role == "SalesManager"
      fill_in "Username",:with => "google.salesmgr@servicesource.com.sitgoog1p"
      fill_in "Password",:with => "testgoogle123!"
      find(:id,"Login").click
      puts "Logged in successfully"
      sleep 3
    elsif user_role == "SalesRep"
      fill_in "Username",:with => "google.salesrep@servicesource.com.google"
      fill_in "Password",:with => "testgoogle123!"
      find(:id,"Login").click
      puts "Logged in successfully"
      sleep 3
    elsif user_role == "SalesOps"
      fill_in "Username",:with => "google.salesops@servicesource.com.google"
      fill_in "Password",:with => "testgoogle123!"
      find(:id,"Login").click
      puts "Logged in successfully"
      sleep 3
    else
      puts "user role does not matched"
    end
  end

  When(/^I search recently created case and click on underlined case$/) do
    find(:xpath,".//*[@id='phSearchInput']").set($newcreatedcase)
    sleep 2
    find(:xpath,".//*[@id='phSearchButton']").click
    sleep 2
    click_link($newcreatedcase)
    sleep 2
  end

  Then(/^I should see recently created caseno$/) do
    if find_link($newcreatedcase).visible?
      puts "caseno is in pending list"
    else
      writeFailure "no records to display"
    end
  end

  When(/^I choose contact name through look up field$/) do
    main = page.driver.browser.window_handles.first
    find(:xpath,".//*[@id='cas3_lkwgt']/img").click
    sleep 25
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "smoke-test-contact")
    sleep 5
    find_button('Go!').click
    sleep 14
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      table.all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
    sleep 10
  end

  When(/^I choose opportunity through lookup field$/) do
    main = page.driver.browser.window_handles.first
    find(:xpath,".//*[@id='CF00N3600000PVaFA_lkwgt']/img").click
    sleep 21
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    sleep 5
    fill_in("lksrch",:with=> "smoke-test-opportunity")
    sleep 5
    find_button('Go!').click
    sleep 14
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      table.all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
    sleep 10
  end

When(/^I note the case number which is just created$/) do
  $case_num = find(:xpath,"//h2[@class='pageDescription']").text
  puts $case_num
end

When(/^I check the request escalation check box$/) do
  if page.has_field?("00N3600000PVaFZ")
    find(:id, "00N3600000PVaFZ").click
    puts "request escalation field is checked"
  else
    writeFailure "request escalation field is not available"
  end
end

When(/^I enter value in the escalation reason field$/) do
 if page.has_field?("Escalation Reason")
   fill_in("Escalation Reason",:with=> "test")
 end
end

Then(/^I logout from the current user$/) do
  begin
    sleep 5
    find(:id,"userNavLabel").click
		within all('.mbrMenuItems')[0] do
			click_on 'Logout'
			sleep 4
		end
		sleep 2
		puts "Logged out Successfully"
    sleep 2
	end
end

When(/^I click "([^"]*)" link for the specific Case in home tab$/) do |arg1|
  sleep 10
  puts $case_num
#  if page.has_xpath?("//a[contains(text(),'View More')]")
#    find(:xpath, "//a[contains(text(),'View More')]").click
#  else
#    puts "No view more link is available"
#  end
#  within  all(".pbBody")[6] do
#    puts "hi1"
#    sleep 2
#    puts $case_num
#    puts "h12"
#    if find_link($case_num).visible?
#      click_on $case_num
#      puts "case number #{$case_num} is available under Items To Approve"
#      sleep 5
#    end
#//th[a[contains(.,00011839)]]/preceding-sibling::td/a[contains(text(),'Approve / Reject')]
    if page.has_xpath?("//th[a[contains(.,'#{$case_num}')]]/preceding-sibling::td/a[contains(text(),'Approve / Reject')]")
      find(:xpath, "//th[a[contains(text(),'#{$case_num}')]]/preceding-sibling::td/a[contains(text(),'Approve / Reject')]").click
      puts "clicked on Approve / Reject link of #{arg1}"
    else
      writeFailure "#{arg1} is not available"
    end
  end
  
When(/^I should click on approve button$/) do
  sleep 5
  find_button('Approve').click
end

When(/^I check priority and escalated value$/) do
  sleep 2
  within all('.pbSubsection')[0] do
    if page.has_xpath?("//td[contains(text(),'Priority')]/following-sibling::td[contains(text(), 'Low')]")
      puts "Priority is equal to Low"
    else
      writeFailure "Priority is not equal to Low"
    end
  end
    if page.has_xpath?(".//*[@id='IsEscalated_chkbox']|img[@title='Checked']")
       puts "Escalated value is checked"
    else
      writeFailure "Escalated value is not checked"
    end
  end


When(/^I check case milestone and target date value under case management section$/) do
 sleep 5
    #within all('.pbBody')[8] do
    within all('.pbBody')[5] do      
      table=all("tbody")[0]      
      sleep 5
      puts table.all('tr')[1].all('th')[0].all('a')[0].text.to_s
#      @actual_time_remaining == "2880"
      @existing_time_remaining = table.all('tr')[1].all('td')[4]
      puts "actual time remaining should be: #{@actual_time_remaining}"
      puts "existing time remaining is : #{@existing_time_remaining}"
#      if @actual_time_remaining.to_s == @existing_time_remaining.text.to_s
#        puts "Case Milestone is equal to 2880 mins"
#      else
#        writeFailure "Case Milestone is not equal to 2880 mins"
#      end
      @target_date = table.all('tr')[1].all('td')[2].text.to_s
      puts "Target Date is #{@target_date}"
    end
end

When(/^I check that lock icon appears next to edit button$/) do
  if page.has_xpath?("//td[@id='topButtonRow']/img[@alt='Locked']")
    puts "Lock icon appears next to edit button"
  else
   writeFailure "Lock icon is not appearing next to edit button"
  end
end