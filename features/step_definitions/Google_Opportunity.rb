
Then(/^I should see salesforce Opportunity page succesfully$/) do
  $pageTitle = page.title
  puts "current page title = #{$pageTitle}"
  if $pageTitle == "Salesforce - Performance Edition"
     puts "succesfully visited home page"
  else
     puts "Not visited home page successfully"
  end
end

When(/^I select "([^"]*)" from Renewal Status$/) do |value|
  if page.has_field?("Renewal Status")
      select(value, :from => 'Renewal Status')
      sleep 5
    else
     writeFailure "#{value} value is not there in renewal status picklist"
  end
end

Then(/^I should verify Vertical picklist values in opportunity page$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PVaHt']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "Asset Tracking","Automotive","Financial Services","Government","Hospitality/Tourism","Manufacturing","Media & Entertainment","Medical/Health Services","Other","B2B","Education","Food Services","Technology","Real Estate","Resources/Energy","Retail & Wholesale Trade","Telecommunications","Travel and Transport","Utilities"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Vertical picklist"
  else
    writeFailure "expected values are not visible in Vertical picklist"
  end
end

When(/^I search existing opportunity and click$/) do
  fill_in("phSearchInput", :with=> "Smoke_test_opportinity_111")
  sleep 10
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
  click_on "Smoke_test_opportinity_111"
  sleep 10
end

When(/^I double click on local curreny code$/) do
  element = page.find(:xpath,".//*[@id='00N3600000PVaJx_ileinner']")
    page.driver.browser.mouse.double_click(element.native)
    sleep 3
end

Then(/^I should verify local currency code picklist values$/) do
  actualvalues =find(:xpath,"//*[@id='00N3600000PVaJx']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","EUR","GBP","JPY","USD"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in local currency code values"
  else
    writeFailure "expected values are not visible in local currency code values"
  end
end


Then(/^I should see program type field with read only permission$/) do
  if page.has_content?('Program Type')
    puts "program type field is readable"
  else
    writeFailure "program type field is not visible"
  end
end

Then(/^I should see Vertical field with read only permission$/) do
  if page.has_content?('Vertical')
    puts "Vertical field is readable"
  else
    writeFailure "Vertical field is not visible"
  end
end

Then(/^I should see Type of Opportunity field with read only permission$/) do
  if page.has_content?('Type of Opportunity')
    puts "Type of Opportunity field is readable"
  else
    writeFailure "Type of Opportunity field is not visible"
  end
end


Then(/^I should see program type field with read and write permission except for sales ops$/) do
   if page.has_field?("00N3600000PVaHs")
    puts "program type field is editable"
  else
    writeFailure "program type field is not visible"
  end
end

Then(/^I should verify Vertical picklist values under opportunity page layout$/)  do
  actualvalues =find(:xpath,".//*[@id='00N3600000PVaHt']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","Asset Tracking","Automotive","Financial Services","Government","Hospitality/Tourism","Manufacturing","Media & Entertainment","Medical/Health Services","Other","B2B","Education","Food Services","Technology","Real Estate","Resources/Energy","Retail & Wholesale Trade","Telecommunications","Travel & Transport","Utilities"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Vertical picklist values"
  else
    writeFailure "expected values are not visible in Vertical picklist values"
  end
end

Then(/^I should verify program type picklist values$/) do
actualvalues =find(:xpath,".//*[@id='00N3600000PVaHs']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","RLM","RAP","Renewal"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in program type picklist"
  else
    writeFailure "expected values are not visible in program type picklist"
  end
end

Then(/^I should see Vertical field with read and write permission$/) do
if page.has_field?("00N3600000PVaHt")
    puts "Vertical field is editable"
  else
    writeFailure "Vertical field is not visible"
  end
end

Then(/^I should see Type of Opportunity field with read and write permission$/) do
if page.has_field?("00N3600000PVaHu")
    puts "Type of Opportunity field is editable"
  else
    writeFailure "Type of Opportunity field is not picklist"
  end
end

Then(/^I should verify Type of Opportunity picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PVaHu']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","Cross Sell","Multi-Year"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Type of Opportunity picklist"
  else
    writeFailure "expected values are not visible in Type of Opportunity picklist"
  end
end

Then(/^I should see Client ID field with read write permission$/) do
   if page.has_field?("00N3600000PVaIA")
    puts "Client ID field is editable"
  else
    writeFailure "Client ID field is not picklist"
  end
end

When(/^I click on quote number under quote section$/) do
  find(:xpath,"//a[contains(text(),'00031702')]").click
  sleep 10
end



Then(/^I fill all mandantory fields to create a new opportunity$/) do
  $newopportunity="smoke-test-quote" + Random.new.rand(0001..10000).to_s
  puts $newopportunity
  fill_in "Opportunity Name",:with => $newopportunity
  sleep 3

  # to click on account
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='opp4_lkwgt']/img").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-account-")
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

  fill_in "Close Date",:with => "9/27/2016"
  sleep 2
  select("Not Contacted", :from => 'opp11')
  sleep 2
  select("Volume", :from => 'Opportunity Type')
  select("Direct", :from => 'Direct/Channel')
  select("ANZ", :from => 'Client Region')
  select("United Kingdom", :from => 'Country')
  select("NALA", :from => 'SSI Theatre')
  sleep 2
  # to click on account
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='Pricebook2_lkwgt']/img").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "*")
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

Then(/^I should see direct channel field under partner information$/) do
  if page.has_field?("Direct/Channel")
    puts "direct channel field is visible"
  else
    writeFailure "direct channel field is not found"
  end
end

Then(/^I should see Google SFDC ID field under opportunity detail$/) do
  if page.has_content?("Google SFDC ID")
    puts "Google SFDC ID field is visible"
  else
    writeFailure "Google SFDC ID field is not found"
  end
end

When(/^I click on underlying opportunity name$/) do
  sleep 3
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[1].all('a')[0].click
    puts "opportunity is selected"
  end
end

When(/^I click on opportunity link under renewal relationship details$/) do
  find(:xpath,".//*[@id='CF00N3600000PVO7I_ilecell']/div/a").click
  sleep 5
end

Then(/^I should see Existing Product field in opportunity edit page$/) do
  if page.has_field?("Existing Product")
    puts "Existing Product field is visible"
  else
    writeFailure "Existing Product field is not found"
  end
end

When(/^I click on new quote button$/) do
  find(:xpath,"//input[@value='New Quote']").click
  sleep 5
end

When(/^I fill quote name under quote information section$/) do
 $newquote="smoke-test-quote-1-" + Random.new.rand(0001..10000).to_s
  puts $newquote
  fill_in "Quote Name",:with => $newquote
  sleep 5
  select("Direct", :from => '00N3600000PVaKD')
  sleep 5
  select("2", :from => '00N3600000PVaKC')
  sleep 5
end

When(/^I click on opporunity name under quote detail$/) do
  find(:xpath,".//*[@id='Opportunity_ilecell']/div/a").click
  sleep 5
end

When(/^I select "([^"]*)" from stage picklist$/) do |value|
  select("Closed Sale", :from => 'opp11')
end

When(/^I select "([^"]*)" from view picklist$/) do |value|
  sleep 5
  select value, :from => "View:"
  if find(:button,"Go!").visible? == true
    click_on "Go!"
    sleep 5
  else
    puts "Go! button is not visible"
  end
end

Then(/^I should see Covered Product field in opportunity edit page$/) do
  if page.has_field?("Covered Product")
    puts "Covered Product field is visible"
  else
    writeFailure "Covered Product field is not found"
  end
end

Then(/^I should see Product field in opportunity edit page$/) do
  if page.has_field?("Product")
    puts "Product field is visible"
  else
    writeFailure "Product field is not found"
  end
end

Then(/^I should see Original Order Number under order information$/) do
  if page.has_field?("Original Order Number")
    puts "Original Order Number field is visible"
  else
    writeFailure "Original Order Number field is not found"
  end
end

Then(/^I should verify direct channel field permission$/) do
  if page.has_select?("*Direct/Channel", :selected => "--None--")
    puts "direct channel field is editable picklist"
  else
    puts "direct channel field is not picklist"
  end
end

Then(/^I should verify Google SFDC ID field permission$/) do
  if page.has_content?("Google SFDC ID")
    puts "Google SFDC ID is a text field"
  else
    writeFailure "Google SFDC ID field is not found"
  end
end

When(/^I click on new renewable line item button$/) do
  find(:xpath,"//input[@value='New Renewable Line Item']").click
  sleep 5
end

Then(/^I should verify Original Order Number field permission$/) do
  if page.has_field?("Original Order Number")
    puts "Original Order Number is a text field"
  else
    writeFailure "Original Order Number field is not found"
  end
end

Then(/^I should verify business line picklist values$/) do
  actualvalues =find_field("Business Line").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["Maps"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in business line picklist"
  else
    writeFailure "expected values are not visible in business line picklist"
  end
end

Then(/^I should verify Client Territory picklist values$/) do
  actualvalues =find_field("Client Territory").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["TBD"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Client Territory picklist"
  else
    writeFailure "expected values are not visible in Client Territory picklist"
  end
end

Then(/^I should verify Renewal Currencies picklist values$/) do
  actualvalues =find_field("Opportunity Currency").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["EUR - Euro","GBP - British Pound", "JPY - Japanese Yen","USD - U.S. Dollar"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Renewal Currencies picklist"
  else
    writeFailure "expected values are not visible in Renewal Currencies picklist"
  end
end

Then(/^I should verify SSI Theatre picklist values$/) do
  actualvalues =find_field("SSI Theatre").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","APAC","EMEA", "NALA"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in SSI Theatre picklist"
  else
    writeFailure "expected values are not visible in SSI Theatre picklist"
  end
end

Then(/^I should verify Client Regions picklist values$/) do
  actualvalues =find_field("Client Region").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","ANZ","ASIA", "Canada","Commercial","EMEA","EMEA - DACH","EMEA - FRITES","EMEA - Other","EMEA - UK","Federal","Japan","LATAM","MIDDLE EAST - UNITED ARAB EMIRATES","NA","Other APAC","SLED","UK&I - UNITED KINGDOM"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Client Regions picklist"
  else
    writeFailure "expected values are not visible in Client Regions picklist"
  end
end

When(/^I fill all mandantory fields to create new renewable line item$/) do
  fill_in "Existing Start Date",:with => "9/27/2016"
  sleep 3
  fill_in "New Start Date",:with => "9/27/2016"
  sleep 3
  fill_in "Existing End Date",:with => "9/27/2016"
  sleep 3
  fill_in "New End Date",:with => "9/27/2016"
  sleep 3
  fill_in "Quantity",:with => "200"
  sleep 3
  fill_in "Previous Price",:with => "500"
  sleep 3
  fill_in "j_id0:theFrm:pageBlockId:j_id29:j_id31:8:j_id32",:with => "50"
#  fill_in "j_id0:theFrm:pageBlockId:j_id29:j_id31:13:j_id32",:with => "50"
  select("USD", :from => "j_id0:theFrm:pageBlockId:j_id29:j_id31:9:j_id32")
  # to select existing product
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:0:j_id32_lkwgt']/img").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-product")
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

  # to select owner
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id31:14:j_id32_lkwgt']/img").click
  sleep 25
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "admin")
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

When(/^I click on new quote button under quotes section$/) do
   find(:xpath,"//input[@name='newQuote']").click
   sleep 5
end

When(/^I click on add line item under quote line items$/) do
  find(:xpath,"//input[@name='addQuoteLine']").click
  sleep 5
end

When(/^I search opportunity "([^"]*)" under search input field$/) do |opportunity_name|
  fill_in "phSearchInput",:with => opportunity_name
  sleep 2
  click_button('Search')
  sleep 3
  click_link(opportunity_name)
end

Then(/^I click on Edit Product Line Item in opportunity page$/) do
   
end