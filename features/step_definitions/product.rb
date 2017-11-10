
Given(/^I should navigate to product tab in saleforce application$/) do
  step 'I enter the credentials to the Zenith application'
  sleep 10
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 5
  find(:xpath,"//a[@class='listRelatedObject productBlock title']").click
  sleep 5
end

When(/^I enter product name as "([^"]*)"$/) do |value|
  $newproduct= value + Random.new.rand(0001..10000).to_s
  puts $newproduct
  fill_in("Name",:with=> $newproduct)
  sleep 5
end

When(/^I enter product code as "([^"]*)"$/) do |value|
  fill_in("00N3600000PVaJg",:with=> value)
  sleep 5
end

When(/^I check active check box$/) do
  check 'IsActive'
  sleep 5
end

When(/^I click on add button under standard price section$/) do
  find(:xpath,".//input[@title='Add']").click
  sleep 5
end

When(/^I enter us dollar standard price as "([^"]*)"$/) do |value|
  fill_in("td0_2",:with=> value)
  sleep 5
end

When(/^I enter gbp british pound standard price as "([^"]*)"$/) do |value|
  fill_in("td1_2",:with=> value)
  sleep 5
end

When(/^I enter eur standard price as "([^"]*)"$/) do |value|
  fill_in("td2_2",:with=> value)
  sleep 5
end

When(/^I enter japanese yen standard price as "([^"]*)"$/) do |value|
  fill_in("td3_2",:with=> value)
  sleep 5
end

When(/^I click on Save button from bottom row$/) do
  find(:xpath,"//input[@title='Save']").click
  sleep 5
end