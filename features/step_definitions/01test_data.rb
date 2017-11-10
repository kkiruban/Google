Given(/^I should navigate to "Accounts" tab in emea application$/) do
  sleep 5
  step 'I enter the credentials to the Zenith application'
  puts "Accounts tab is clicked"
  click_on "Accounts"
end

When(/^I fill account name as "([^"]*)"$/) do |accname|
  within all('.pbSubsection')[0] do
    randomvalue=('0001'..'9999').to_a.sample
    accountname= "#{accname}#{randomvalue}"
    fill_in("Account Name", :with => accountname)
  end
end



When(/^I fill contact name as "([^"]*)"$/) do |contactname|
  randomvalue=('aaaaa'..'zzzzz').to_a.sample
  contactvalue = contactname + randomvalue
  fill_in("Last Name", :with => contactvalue)
  sleep 5
end


When(/^I fill all mandatory fields to create a random new contact$/) do
  sleep 10
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='con4_lkwgt']/img").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-account-")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  select("Client", :from => "Type")
  sleep 5
end


When(/^I get the account name$/) do
  @@gettext = find(:xpath,"//*[@id='contactHeaderRow']/div[2]/h2").text
  puts @@gettext
end

Given(/^I should navigate to "([^"]*)" tab in saleforce application$/) do |tab|
  step 'I enter the credentials to the Zenith application'
  sleep 30
  click_link(tab)
  sleep 10
end

Given(/^I should navigate to "([^"]*)" tab$/) do |tab|
  sleep 5
  click_link(tab)
  sleep 5
end

When(/^I enter value "([^"]*)" in currency field$/) do |arg1|
  arg2 = getquotecurrency "currency_value"
  within all('.pbSubsection')[1] do
    arg2.each do |key,value|
      k = key
      v = value
      if k==arg1
        find_field("Currency").select(v)
        sleep 2
        puts v
        sleep 3
      end
    end
  end
end

When(/^I select "([^"]*)" from record type of new record picklist$/) do |value|
  select(value, :from => 'Record Type of new record')
end

When(/^I click on "([^"]*)" button under select opportunity record type$/) do |arg1|
  within('#bottomButtonRow') do
    find(:xpath,"//*[@id='bottomButtonRow']/input[1]").click
  end
end

#step definition to create a new quote
When(/^I fill value for all mandatory field to create quote$/) do
  begin
    arg = getquotedetails "create_New_quote"
    sleep 2
    within all('.pbSubsection')[0] do
      table = all("tbody")[0]
      sleep 2
      find(:id, "00N61000004D5gr").select(arg["Quote_Type"])
      sleep 2
      find(:id, "00N61000004D5gq").select(arg["Quote_Type_Year"])
      sleep 2
    end
    within all('.pbSubsection')[1] do
      table = all("tbody")[0]
      sleep 2
      find_field("Earliest New Start Date").set(arg["Earliest_New_Start_Date"])
      sleep 2
      find_field("Latest New End Date").set(arg["Latest_New_End_Date"])
      sleep 2
      find_field("Transaction Amount").set(arg["Transaction_Amount"])
      sleep 2
    end
    sleep 2

    main = page.driver.browser.window_handles.first
    find("img[alt='Opportunity Lookup (New Window)']").click
    sleep 5
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "smoke-test-opportunity-")
    sleep 5
    find_button('Go!').click
    sleep 4
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      table.all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
    sleep 10
  end
end

When(/^I fill opportunity name as "([^"]*)"$/) do |opportunityname|
  randomvalue=('aaaaa'..'zzzzz').to_a.sample
  oppvalue = opportunityname + randomvalue
  sleep 5
  fill_in("Opportunity Name", :with=>"")
  fill_in("Opportunity Name", :with => oppvalue)
  puts "i fill the opportunity name as #{randomvalue}"
  sleep 5
end

When(/^I fill required values for mandantory fields to create a new opportunity$/) do
  sleep 10
  ymlval= getCreateNewOpportunity "createopportunitytestdata"
#  to choose a account name
  main = page.driver.browser.window_handles.first
   find(:css,"#opp4_lkwgt").click
    sleep 5
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> "smoke-test-account-")
    sleep 5
    find_button('Go!').click
    sleep 4
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      table=all("tbody")[0]
      table.all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
  sleep 10
  # snippet to select values from direct/channel,businessline,opportunity currency picklists
  within all('.pbSubsection')[0] do
    select(ymlval["Direct_Channel"], :from => "Direct/Channel")
    select(ymlval["Business_Line"], :from => "Business Line")
    select(ymlval["Opportunity_Currency"], :from => "Opportunity Currency")
    select(ymlval["Stage"], :from => "opp11")
  end
  # snippet to select values from ssi theatre,client territory,client region,country picklists
  within all('.pbSubsection')[1] do
    select(ymlval["SSI_Theatre"], :from => "SSI Theatre")
    select(ymlval["Client_Territory"], :from => "Client Territory")
    select(ymlval["Client_Region"], :from => "Client Region")
    select(ymlval["Country"], :from => "00N61000004D5dV")
  end
  within all('.pbSubsection')[2] do
    table = all("tbody")[0]
    sleep 2
    find_field("Estimated Close Date").set(ymlval["Estimated_Close_Date"])
  end
  within all('.pbSubsection')[9] do
    table = all("tbody")[0]
    sleep 2
    find(:id, "opp9").set(ymlval["Close_Date"])
  end
end









#------------------------------------------------------------------------










#Create new account
When(/^I create new account test record "([^"]*)"$/) do |accout_Name|
  begin
    $new_contact=""
    flag=0
    temp=""
    step 'I enter the credentials to the Zenith application'
    step 'I navigate to "Accounts" tab in the application'
    step 'I wait for 10 seconds'
    if page.has_xpath?('//input[@title="Search..."]')
      #The opportunity is of type "Opportunity Asset - Edit Books"
      if (ENV['UserRole']=="nalaopsmgrsit")
        temp="#{accout_Name}"+"Ops_Mgr"
        puts "#{temp}"
      elsif (ENV['UserRole']=="nalaopsrepsit")
        temp="#{accout_Name}"+"Ops_Rep"
        puts "#{temp}"
      elsif (ENV['UserRole']=="Admin")
        temp="#{accout_Name}"+"Ba"
        puts "#{temp}"
      elsif (ENV['UserRole']=="nalasalesrepsit")
        temp="#{accout_Name}"+"Sales_Rep"
        puts "#{temp}"
      elsif (ENV['UserRole']=="nalasalesmgrsit")
        temp="#{accout_Name}"+"Sales_Mgr"
        puts "#{temp}"
      elsif (ENV['UserRole']=="nalasalesopssit")
        temp="#{accout_Name}"+"Sales_Ops"
        puts "#{temp}"
      end
      #find(:xpath, '//input[@title="Search..."]').set accout_Name
      find(:xpath, '//input[@title="Search..."]').set temp
      sleep 5
      find(:xpath, '//input[@value="Search"]').click
      sleep 10
    end
    if page.has_xpath?('//div[contains(@class,"accountBlock")]')
      within(:xpath, '//div[contains(@class,"accountBlock")]')do
        #if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
        if page.has_xpath?('//a[text()="'"#{temp}"'"]')
          sleep 10
          #find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
          find(:xpath, '(//a[text()="'"#{temp}"'"])[1]').click
          #puts "The record - #{accout_Name} - is existing record"
          puts "The record - #{temp} - is existing record"
        else
          flag=1
        end
      end
    else
      flag=1
    end
    if flag==1
      #step 'I login as BA'
      if (ENV['UserRole']=="nalasalesopssit")
        puts "login as sales manager"
        step 'I login as BA'
      else
        step 'I enter the credentials to the Zenith application'
      end
      #step 'I enter the credentials to the Zenith application'
      step 'I navigate to "Accounts" tab'
      step 'I wait for 5 seconds'
      step 'I follow on "New" button'
      if page.has_xpath?('//label[text()="Account Name"]')
        #find(:xpath, '//label[text()="Account Name"]/parent::td/following-sibling::td[1]//input').set accout_Name
        find(:xpath, '//label[text()="Account Name"]/parent::td/following-sibling::td[1]//input').set temp
        #fill_in "Account Name",:with => accout_Name
      else
        writeFailure"Fail to entered data in Account Name"
      end
      #      if page.has_xpath?('//label[text()="Account Currency"]')
      #        find(:xpath, '//label[text()="Account Currency"]/parent::td/following-sibling::td[1]//select').set 'USD - U.S. Dollar'
      #        puts "Entered data in Account Currency"
      #      else
      #        writeFailure "Fail to entered data in Account Currency"
      #      end

      if page.has_xpath?('//label[text()="Client Theatre"]')
        find(:xpath, '//label[text()="Client Theatre"]/parent::td/following-sibling::td[1]//select').select 'NALA'
        puts "Entered data in Client Theatre"
      else
        writeFailure "Fail to entered data in Client Theatre"
      end

      if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
        find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
      end
      if page.has_content?("Error: Invalid Data.")
        writeFailure "Account NOT saved successfully due to Invalid Data. "
      else
        puts "Account created successfully"
      end
    end
    #--------------------------------------------------------------------------------
    #               Create new CONTACT
    #--------------------------------------------------------------------------------
    sleep 10
    #if page.has_xpath?('(//div[contains(@id,"ContactList")]//a[text()="Edit"])[1]')==false
    if page.has_xpath?('//div[contains(@id,"ContactList")]//th[text()="No records to display"]')
      puts "No contact found"
      if page.has_xpath?('//input[@title="New Contact"]')
        find(:xpath, '//input[@title="New Contact"]').click
        puts "New contact button is clicked"
        step 'Create new contact'
        if page.has_xpath?('//td[text()="Account Name"]/following-sibling::td[1]//a')
          find(:xpath, '//td[text()="Account Name"]/following-sibling::td[1]//a').click
          puts "Navigated back to account page"
        end
      else
        writeFailure "The - New Contact - button is not found and hence fail to create - New Contact - record"

      end
    else
      temp=""
      temp=find(:xpath, '//div[contains(@class,"contactBlock")]//tr[1]/th[2]').text

      if temp=="Contact Name"
        $new_contact=find(:xpath, '//div[contains(@class,"contactBlock")]//tr[2]/th[1]/a').text
      else
        writeFailure "The column - Contact Name - is not appearing in the second column under contact section"
      end
    end

  end
end

#Step definition to Create new contact
Then(/^Create new contact$/) do
  $new_contact="Smoke-test-contact-"+Random.new.rand(111..9999).to_s
  if page.has_xpath?('//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input')
    find(:xpath, '//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input').set $new_contact
    puts "Data in Last Name field has been entered"
    #fail(ArgumentError.new('Fail'))
  else
    writeFailure "Fail to enter data in - Last Name - field"
  end

  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
  end
  if page.has_content?("Error: Invalid Data.")
    writeFailure "Account NOT saved successfully due to Invalid Data. "
  else
    puts "New Contact has been created"
  end
end

When(/^I create new success plan$/) do
  begin
    flag=0
    temp=""
    step 'I enter the credentials to the Zenith application'
    sleep 8
    temp_var=ENV['UserRole']
    step 'I login as BA'
    step 'I navigate to "Accounts" tab in the application'
    step 'I wait for 5 seconds'
    if page.has_xpath?('//input[@title="Search..."]')
      #The opportunity is of type "Opportunity Asset - Edit Books"
      if (temp_var=="nalaopsmgrsit")
        accout_Name="PES_Account3_Ops_Mgr"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalaopsrepsit")
        accout_Name="PES_Account3_Ops_Rep"
        #puts "#{accout_Name}"
      elsif (temp_var=="Admin")
        accout_Name="PES_Account3_Ba"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalasalesrepsit")
        accout_Name="PES_Account3_Sales_Rep"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalasalesmgrsit")
        accout_Name="PES_Account3_Sales_Mgr"
        # puts "#{accout_Name}"
      elsif (temp_var=="nalasalesopssit")
        accout_Name="PES_Account3_Sales_Ops"
        #puts "#{accout_Name}"
      end
      find(:xpath, '//input[@title="Search..."]').set accout_Name
      sleep 2
      find(:xpath, '//input[@value="Search"]').click
      sleep 5
    end

    if page.has_xpath?('//div[contains(@class,"accountBlock")]')
      within(:xpath, '//div[contains(@class,"accountBlock")]')do
        #if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
        if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
          sleep 5
          find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
        else
          flag=1
        end
      end
    else
      flag=1
    end

    if page.has_xpath?('//h3[text()="Success Plans (Account)"]/ancestor::div[contains(@class,"listRelatedObject")][1]//th[text()="No records to display"]')
      if page.has_xpath?('//input[@title="New Success Plan"]')
        find(:xpath, '//input[@title="New Success Plan"]').click
        #######################################
        # Creating new Success Plans (Account)
        #######################################

        if page.has_xpath?('//label[text()="Success Plan Template"]/parent::td/following-sibling::td[1]//span//input')
          find(:xpath, '//label[text()="Success Plan Template"]/parent::td/following-sibling::td[1]//span//input').set "APT-000000"
        else
          writeFailure"Fail to entered data in Success Plan Template"
        end

        if page.has_xpath?('//label[text()="Plan Comments"]/parent::td/following-sibling::td[1]//textarea')
          find(:xpath, '//label[text()="Plan Comments"]/parent::td/following-sibling::td[1]//textarea').set "NALA"
        else
          writeFailure"Fail to entered data in Plan Comments textarea"
        end

        if page.has_xpath?('//label[text()="Phase Start Date"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a')
          find(:xpath, '//label[text()="Phase Start Date"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a').click
        else
          writeFailure"Fail to entered data in Phase Start Date"
        end

        if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
          find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
        end
        if page.has_content?("Error: Invalid Data.")
          writeFailure "Account NOT saved successfully due to Invalid Data. "
        else
          puts "New Success Plan created successfully"
        end

      else
        writeFailure 'The - New Success Plan - button is not found'
      end

    end
  end
end

When(/^I create new Service Contracts$/) do
  begin
    flag=0
    temp=""
    step 'I enter the credentials to the Zenith application'
    sleep 8
    temp_var=ENV['UserRole']
    step 'I login as BA'
    step 'I navigate to "Accounts" tab in the application'
    step 'I wait for 5 seconds'
    if page.has_xpath?('//input[@title="Search..."]')
      #The opportunity is of type "Opportunity Asset - Edit Books"
      if (temp_var=="nalaopsmgrsit")
        accout_Name="PES_Account3_Ops_Mgr"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalaopsrepsit")
        accout_Name="PES_Account3_Ops_Rep"
        #puts "#{accout_Name}"
      elsif (temp_var=="Admin")
        accout_Name="PES_Account3_Ba"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalasalesrepsit")
        accout_Name="PES_Account3_Sales_Rep"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalasalesmgrsit")
        accout_Name="PES_Account3_Sales_Mgr"
        # puts "#{accout_Name}"
      elsif (temp_var=="nalasalesopssit")
        accout_Name="PES_Account3_Sales_Ops"
        #puts "#{accout_Name}"
      end
      find(:xpath, '//input[@title="Search..."]').set accout_Name
      sleep 2
      find(:xpath, '//input[@value="Search"]').click
      sleep 5
    end

    if page.has_xpath?('//div[contains(@class,"accountBlock")]')
      within(:xpath, '//div[contains(@class,"accountBlock")]')do
        #if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
        if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
          sleep 10
          #find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
          find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
          #puts "The record - #{accout_Name} - is existing record"
          #puts "The record - #{accout_Name} - is existing record"
        else
          flag=1
        end
      end
    else
      flag=1
    end

    if page.has_xpath?('//h3[text()="Service Contracts"]/ancestor::div[contains(@class,"listRelatedObject")][1]//th[text()="No records to display"]')
      if page.has_xpath?('//input[@title="New Service Contract"]')
        find(:xpath, '//input[@title="New Service Contract"]').click
        #################################
        # Creating New Service Contracts
        #################################
        sleep 5
        if page.has_xpath?('//label[text()="Contract Name"]/parent::td/following-sibling::td[1]//input')
          temp=""
          temp="Testing_"+Random.new.rand(111..9999).to_s
          find(:xpath, '//label[text()="Contract Name"]/parent::td/following-sibling::td[1]//input').set temp
        else
          writeFailure"Fail to entered data in Contract Name"
        end

        if page.has_xpath?('//label[text()="Start Date"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a')
          find(:xpath, '//label[text()="Start Date"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a').click
        else
          writeFailure"Fail to entered data in Start Date"
        end

        if page.has_xpath?('//label[text()="End Date"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a')
          find(:xpath, '//label[text()="End Date"]/parent::td/following-sibling::td[1]//span[@class="dateFormat"]/a').click
        else
          writeFailure"Fail to entered data in End Date"
        end

        if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
          find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
        end
        if page.has_content?("Error: Invalid Data.")
          writeFailure "Account NOT saved successfully due to Invalid Data. "
        else
          puts "New Service Contract created successfully"
        end

      else
        writeFailure 'The - New Service Contract - button is not found'
      end
    else
      puts "The Service Contract record is present"
    end
  end
end


When(/^I create new Survey Responses$/) do
  begin
    flag=0
    temp=""
    step 'I enter the credentials to the Zenith application'
    sleep 8
    temp_var=ENV['UserRole']
    step 'I login as BA'
    step 'I navigate to "Accounts" tab in the application'
    step 'I wait for 5 seconds'
    if page.has_xpath?('//input[@title="Search..."]')
      #The opportunity is of type "Opportunity Asset - Edit Books"
      if (temp_var=="nalaopsmgrsit")
        accout_Name="PES_Account3_Ops_Mgr"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalaopsrepsit")
        accout_Name="PES_Account3_Ops_Rep"
        #puts "#{accout_Name}"
      elsif (temp_var=="Admin")
        accout_Name="PES_Account3_Ba"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalasalesrepsit")
        accout_Name="PES_Account3_Sales_Rep"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalasalesmgrsit")
        accout_Name="PES_Account3_Sales_Mgr"
        # puts "#{accout_Name}"
      elsif (temp_var=="nalasalesopssit")
        accout_Name="PES_Account3_Sales_Ops"
        #puts "#{accout_Name}"
      end
      find(:xpath, '//input[@title="Search..."]').set accout_Name
      sleep 2
      find(:xpath, '//input[@value="Search"]').click
      sleep 5
    end

    if page.has_xpath?('//div[contains(@class,"accountBlock")]')
      within(:xpath, '//div[contains(@class,"accountBlock")]')do
        #if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
        if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
          sleep 10
          #find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
          find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
          #puts "The record - #{accout_Name} - is existing record"
          #puts "The record - #{accout_Name} - is existing record"
        else
          flag=1
        end
      end
    else
      flag=1
    end

    if page.has_xpath?('//h3[text()="Survey Responses"]/ancestor::div[contains(@class,"listRelatedObject")][1]//th[text()="No records to display"]')
      if page.has_xpath?('//input[@title="New Survey Response"]')
        find(:xpath, '//input[@title="New Survey Response"]').click
        ###############################
        # Creating New Survey Response
        ###############################
        if page.has_xpath?('//label[text()="Survey Name"]/parent::td/following-sibling::td[1]//input')
          temp=""
          temp="Testing_Survey_"+Random.new.rand(111..9999).to_s
          find(:xpath, '//label[text()="Survey Name"]/parent::td/following-sibling::td[1]//input').set temp
        else
          writeFailure"Fail to entered data in Survey Name"
        end

        if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
          find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
        end
        if page.has_content?("Error: Invalid Data.")
          writeFailure "Account NOT saved successfully due to Invalid Data. "
        else
          puts "New Service Contract created successfully"
        end

      else
        writeFailure 'The - New Service Contract - button is not found'
      end

    end
  end
end


When(/^I created Activity History record$/) do
  begin
    flag=0
    temp=""
    step 'I enter the credentials to the Zenith application'
    sleep 8
    temp_var=ENV['UserRole']
    step 'I login as Operation Manager'
    step 'I navigate to "Accounts" tab in the application'
    step 'I wait for 5 seconds'
    if page.has_xpath?('//input[@title="Search..."]')
      #The opportunity is of type "Opportunity Asset - Edit Books"
      if (temp_var=="nalaopsmgrsit")
        accout_Name="PES_Account3_Ops_Mgr"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalaopsrepsit")
        accout_Name="PES_Account3_Ops_Rep"
        #puts "#{accout_Name}"
      elsif (temp_var=="Admin")
        accout_Name="PES_Account3_Ba"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalasalesrepsit")
        accout_Name="PES_Account3_Sales_Rep"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalasalesmgrsit")
        accout_Name="PES_Account3_Sales_Mgr"
        # puts "#{accout_Name}"
      elsif (temp_var=="nalasalesopssit")
        accout_Name="PES_Account3_Sales_Ops"
        #puts "#{accout_Name}"
      end
      find(:xpath, '//input[@title="Search..."]').set accout_Name
      sleep 2
      find(:xpath, '//input[@value="Search"]').click
      sleep 5
    end

    if page.has_xpath?('//div[contains(@class,"accountBlock")]')
      within(:xpath, '//div[contains(@class,"accountBlock")]')do
        #if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
        if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
          sleep 10
          #find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
          find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
          #puts "The record - #{accout_Name} - is existing record"
          #puts "The record - #{accout_Name} - is existing record"
        else
        end
      end
    else
      writeFailure "Fail to find any account with - #{accout_Name} - name"
    end

    if page.has_xpath?('//h3[text()="Activity History"]/ancestor::div[contains(@class,"listRelatedObject")][1]//th[text()="No records to display"]')
      if page.has_xpath?('//input[@title="New Task"]')
        find(:xpath, '//input[@title="New Task"]').click
        sleep 2
        find(:xpath, '//input[@title="Continue"]').click
        sleep 5
        ###############################
        # Creating New Task
        ###############################
        if page.has_xpath?('//label[text()="Priority"]')
          find(:xpath, '//label[text()="Priority"]/parent::td/following-sibling::td[1]//select').select "High"
          #puts "Entered data in Priority"
        else
          writeFailure "Fail to entered data in Priority"
        end

        if page.has_xpath?('//label[text()="Product"]')
          find(:xpath, '//label[text()="Product"]/parent::td/following-sibling::td[1]//select').select "AMP"
          #puts "Entered data in Product"
        else
          writeFailure "Fail to entered data in Product"
        end

        if page.has_xpath?('//label[text()="Subject"]/parent::td[1]/following-sibling::td[1]//input')
          find(:xpath, '//label[text()="Subject"]/parent::td[1]/following-sibling::td[1]//input').set "Call"
          #puts "Data in - Subject - field has been entered"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "Fail to enter data in - Subject - field"
        end
        if page.has_xpath?('//label[text()="Comments"]/parent::td[1]/following-sibling::td[1]//textarea')
          find(:xpath, '//label[text()="Comments"]/parent::td[1]/following-sibling::td[1]//textarea').set "Testing"
          #puts "Data in - Comments - field has been entered"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "Fail to enter data in - Comments - field"
        end
        if page.has_xpath?('//label[text()="Direction"]/parent::td[1]/following-sibling::td[1]//select')
          find(:xpath, '//label[text()="Direction"]/parent::td[1]/following-sibling::td[1]//select').select "Incoming"
          #puts "Data in - Comments - field has been entered"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "Fail to enter data in - Comments - field"
        end

        if page.has_xpath?('//label[text()="Status"]/parent::td[1]/following-sibling::td[1]//select')
          find(:xpath, '//label[text()="Status"]/parent::td[1]/following-sibling::td[1]//select').select "Completed Successfully"
          #puts "Data in - Status - field has been entered"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "Fail to enter data in - Status - field"
        end

        if page.has_xpath?('//label[text()="Name"]/parent::td[1]/following-sibling::td[1]//span/input')
          find(:xpath, '//label[text()="Name"]/parent::td[1]/following-sibling::td[1]//span/input').set $new_contact
          #puts "Data in - Name - field has been entered"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "Fail to enter data in - Name - field"
        end


        if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
          find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
        end
        if page.has_content?("Error: Invalid Data.")
          writeFailure "Account NOT saved successfully due to Invalid Data. "
        else
          puts "Activity History record created successfully"
        end

      else
        writeFailure 'The - New Task - button is not found'
      end

    end
  end
end

When(/^I created New Task$/) do
  begin
    flag=0
    temp=""
    step 'I enter the credentials to the Zenith application'
    sleep 8
    temp_var=ENV['UserRole']
    step 'I login as Operation Manager'
    step 'I navigate to "Accounts" tab in the application'
    step 'I wait for 5 seconds'
    if page.has_xpath?('//input[@title="Search..."]')
      #The opportunity is of type "Opportunity Asset - Edit Books"
      if (temp_var=="nalaopsmgrsit")
        accout_Name="PES_Account3_Ops_Mgr"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalaopsrepsit")
        accout_Name="PES_Account3_Ops_Rep"
        #puts "#{accout_Name}"
      elsif (temp_var=="Admin")
        accout_Name="PES_Account3_Ba"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalasalesrepsit")
        accout_Name="PES_Account3_Sales_Rep"
        #puts "#{accout_Name}"
      elsif (temp_var=="nalasalesmgrsit")
        accout_Name="PES_Account3_Sales_Mgr"
        # puts "#{accout_Name}"
      elsif (temp_var=="nalasalesopssit")
        accout_Name="PES_Account3_Sales_Ops"
        #puts "#{accout_Name}"
      end
      find(:xpath, '//input[@title="Search..."]').set accout_Name
      sleep 2
      find(:xpath, '//input[@value="Search"]').click
      sleep 5
    end

    if page.has_xpath?('//div[contains(@class,"accountBlock")]')
      within(:xpath, '//div[contains(@class,"accountBlock")]')do
        #if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
        if page.has_xpath?('//a[text()="'"#{accout_Name}"'"]')
          sleep 5
          #find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
          find(:xpath, '(//a[text()="'"#{accout_Name}"'"])[1]').click
          #puts "The record - #{accout_Name} - is existing record"
          #puts "The record - #{accout_Name} - is existing record"
        else
        end
      end
    else
      writeFailure "Fail to find any account with - #{accout_Name} - name"
    end

    if page.has_xpath?('//h3[text()="Open Activities"]/ancestor::div[contains(@class,"listRelatedObject")][1]//th[text()="No records to display"]')
      if page.has_xpath?('//input[@title="New Task"]')
        find(:xpath, '//input[@title="New Task"]').click
        sleep 2
        find(:xpath, '//input[@title="Continue"]').click
        sleep 5
        ###############################
        # Creating New Task
        ###############################
        if page.has_xpath?('//label[text()="Priority"]')
          find(:xpath, '//label[text()="Priority"]/parent::td/following-sibling::td[1]//select').select "High"
          #puts "Entered data in Priority"
        else
          writeFailure "Fail to entered data in Priority"
        end

        if page.has_xpath?('//label[text()="Product"]')
          find(:xpath, '//label[text()="Product"]/parent::td/following-sibling::td[1]//select').select "AMP"
          #puts "Entered data in Product"
        else
          writeFailure "Fail to entered data in Product"
        end

        if page.has_xpath?('//label[text()="Subject"]/parent::td[1]/following-sibling::td[1]//input')
          find(:xpath, '//label[text()="Subject"]/parent::td[1]/following-sibling::td[1]//input').set "Call"
          #puts "Data in - Subject - field has been entered"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "Fail to enter data in - Subject - field"
        end
        if page.has_xpath?('//label[text()="Comments"]/parent::td[1]/following-sibling::td[1]//textarea')
          find(:xpath, '//label[text()="Comments"]/parent::td[1]/following-sibling::td[1]//textarea').set "Testing"
          #puts "Data in - Comments - field has been entered"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "Fail to enter data in - Comments - field"
        end
        if page.has_xpath?('//label[text()="Direction"]/parent::td[1]/following-sibling::td[1]//select')
          find(:xpath, '//label[text()="Direction"]/parent::td[1]/following-sibling::td[1]//select').select "Incoming"
          #puts "Data in - Comments - field has been entered"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "Fail to enter data in - Comments - field"
        end

        if page.has_xpath?('//label[text()="Status"]/parent::td[1]/following-sibling::td[1]//select')
          find(:xpath, '//label[text()="Status"]/parent::td[1]/following-sibling::td[1]//select').select "Not Started"
          #puts "Data in - Status - field has been entered"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "Fail to enter data in - Status - field"
        end

        if page.has_xpath?('//label[text()="Name"]/parent::td[1]/following-sibling::td[1]//span/input')
          find(:xpath, '//label[text()="Name"]/parent::td[1]/following-sibling::td[1]//span/input').set $new_contact
          #puts "Data in - Name - field has been entered"
          #fail(ArgumentError.new('Fail'))
        else
          writeFailure "Fail to enter data in - Name - field"
        end


        if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
          find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
        end
        if page.has_content?("Error: Invalid Data.")
          writeFailure "Account NOT saved successfully due to Invalid Data. "
        else
          puts "Activity History record created successfully"
        end

      else
        writeFailure 'The - New Task - button is not found'
      end

    end
  end
end

When(/^I enter data to fields under new account section$/) do
  within all('.pbSubsection')[0] do
    sleep 2
    $account_name = "smoke-test-accounts" + Random.new.rand(01..1000).to_s
    fill_in "Account Name",:with => $account_name
    puts $account_name
    puts "account name is: #{$account_name} "
    if page.has_field?("Account Currency")
      select("USD - U.S. Dollar", :from => "Account Currency")
    end
  end
end

When(/^I click on new button$/) do
  sleep 5
  within('.bRelatedList') do
    sleep 3
    within('.pbHeader') do
      click_on " New "
      puts "clicked on new button"
    end
  end
end

When(/^I enter data to reqired fields under new contacts section$/) do
  sleep 3
  within all('.pbSubsection')[0] do
    if page.has_field?("First Name", :match => :prefer_exact)
      $fist_name = "smoke-test-contacts"
      $last_name = Random.new.rand(01..1000).to_s
      fill_in "First Name",:with => $fist_name
      fill_in "Last Name",:with => $last_name
      puts "contact name is entered"
    end
  end
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Account Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-accounts")
  sleep 5
  find_button('Go!').click
  sleep 4
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

Then(/^I note the contact name created above$/) do
  within all('.pbSubsection')[0] do
    table= all("tbody")[0]
    $contact_name = all('tr')[0].all('td')[1].all('div')[0].text
    puts $contact_name
  end
end

Then(/^I select opportunity edit from record type of new record$/) do
  within('.pbSubsection') do
    select("Opportunity - Edit", :from => "Record Type of new record")
  end
  within('.pbBottomButtons') do
    if find(:button, "Continue").visible?
      click_on "Continue"
    else
      puts "Continue button is not visible"
    end
  end
end

Then(/^I enter data to reqired fields under new opportunity section$/) do
  within all('.pbSubsection')[0] do
    sleep 2
    $opp_name = "smoke-test-opportunity" + Random.new.rand(01..1000).to_s
    fill_in("Opportunity Name", :with=> $opp_name)
    puts "Opportunity Name is: #{$opp_name}"
    sleep 2
    if page.has_field?("Stage", :match => :prefer_exact)
      select("Contacted", :from => "Stage", :match => :prefer_exact)
    end
    if page.has_field?("Close Date")
      fill_in("Close Date",:with => "5/17/2017")
    end
  end
  within all('.pbSubsection')[1] do
    if page.has_field?("Opportunity Type")
      select("Enterprise", :from => "Opportunity Type")
    end

    if page.has_field?("Business Line")
      select("Maps", :from => "Business Line")
    end

    if page.has_field?("Direct/Channel")
      select("Direct", :from => "Direct/Channel")
    end

    if page.has_field?("Client Territory")
      select("TBD", :from => "Client Territory")
    end

    if page.has_field?("Client Region")
      select("Canada", :from => "Client Region")
    end

    if page.has_field?("Country")
      select("United States", :from => "Country")
    end

    if page.has_field?("SSI Theatre")
      select("NALA", :from => "SSI Theatre")
    end
  end
  within all('.pbSubsection')[4] do
    if page.has_field?("Opportunity Currency")
      select("USD - U.S. Dollar", :from => "Opportunity Currency")
    end
  end
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Account Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-accounts")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
  
  #  sleep 3
  #  page.driver.browser.window_handles.first
  #  main = page.driver.browser.window_handles.first
  #  find("img[alt='Price Book Lookup (New Window)']").click
  #  sleep 2
  #  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  #  lookup = page.driver.browser.window_handles.last
  #  page.driver.browser.switch_to.frame("searchFrame")
  #  fill_in("lksrch",:with=> "Standard")
  #  sleep 5
  #  find_button('Go!').click
  #  sleep 4
  #  page.driver.browser.switch_to.window(lookup)
  #  page.driver.browser.switch_to.frame("resultsFrame")
  #  within('.pbBody') do
  #    table=all("tbody")[0]
  #    sleep 2
  #    table.all('tr')[1].all('th')[0].find('a').click
  #  end
  #  sleep 4
  #  page.driver.browser.switch_to.window(main)
end

Then(/^I enter data to reqired fields under new price book section$/) do
  within all('.pbSubsection')[0] do
    if page.has_field?("Price Book Name")
      $price_book = "PES_pricebook_01"
      fill_in("Price Book Name",:with => $price_book)
      puts "value for price book field is entered: #{$price_book}"
    else
      puts "Price Book Name field is not available"
    end
  end
end