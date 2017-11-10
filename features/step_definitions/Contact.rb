
Given(/^I should navigate to contacts tab in saleforce application$/) do
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 20
  find(:xpath,"//a[@class='listRelatedObject contactBlock title']").click
  sleep 20
end

Then(/^I should see "([^"]*)" field with read and write permission for all users$/) do |value|
  if page.has_field?(value)
    puts "#{value} field is visible with editable permission"
  elsif page.has_content?(value)
    writeFailure "#{value} field is visible with readable permission"
  else
    writeFailure "#{value} field is not visible"
  end
end

Then(/^I should see Type picklist values under create new contact page$/) do
  if page.has_field?("Type")
    actualvalues = find_field("Type", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Client","Distributor","End User","Partner","Reseller"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Type picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Type picklist"
    end
  else
    writeFailure "Type field not visible"
  end
end

Then(/^I should see Role picklist values under create new contact page$/) do
  if page.has_field?("Role")
    actualvalues = find_field("Role", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Purchasing Contact","Marketing","Developer","Product Manager","Executive Level","Third Party","IT Director"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Role picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Role picklist"
    end
  else
    writeFailure "Role field not visible"
  end
end

When(/^I enter all mandantory fields to create a new random contact$/) do
  randomvalue=('0000'..'9999').to_a.sample
  $newcontact = "smoke-test-contact-" + randomvalue
  sleep 5
  fill_in('Last Name', with: $newcontact, match: :prefer_exact)

  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find(:xpath,"//*[@id='con4_lkwgt']/img").click
  sleep 30
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-")
  sleep 20
  find_button('Go!').click
  sleep 30
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
end
