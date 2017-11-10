
When(/^I search accounts "([^"]*)" under search input field$/) do |account_name|
  fill_in "phSearchInput",:with => account_name
  sleep 2
  click_button('Search')
  sleep 3
  click_link(account_name)
  sleep 3
end

When(/^I enter account name as "([^"]*)"$/) do |value|
  $newaccount= value + Random.new.rand(0001..10000).to_s
  puts $newaccount
  fill_in "acc2",:with => $newaccount
  sleep 20
end

When(/^I click on new lead button under flex leads$/) do
  find(:xpath,"//input[@value='New Lead']").click
  sleep 5
end

Then(/^I should see account name field with read write permisssion$/) do
  if ENV['UserRole'] == "salesopssit"
    if page.has_content?("Account Name")
      puts  "Account Name field is with read only permission"
    else
      writeFailure "Account name field is not visible"
    end
  else
    if page.has_field?("Account Name")
      puts  "Account Name field is editable"
    else
      writeFailure "Account name field is not visible"
    end
  end
end

When(/^I fill all mandantory fields to create a new leads$/) do
  randomvalue=('0001'..'9999').to_a.sample
  leadvalue= "Smoke-test-leads-1" + randomvalue
  fill_in('name_lastlea2', :with => leadvalue)
  sleep 5
  fill_in('Company', :with => "pe")
  sleep 5
end

When(/^I fill "([^"]*)" in email field$/) do |value|
   fill_in('Email', :with => value)
   sleep 5
end
