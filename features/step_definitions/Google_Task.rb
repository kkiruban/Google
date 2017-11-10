Given(/^I click on new button under my task section$/) do
  sleep 5
  within all('.bRelatedList')[0] do
    puts "My Task section"
    sleep 3
    within('.pbHeader') do
      click_on " New "
      puts "clicked on new button under My Task section"
    end
  end
end

Then(/^I should see Create Follow\-up CSM Task button$/) do
  if page.has_xpath?("//input[@value='Create Follow-up CSM Task']")
    puts "Create Follow\-up CSM Task button is visible"
  else
    writeFailure "Create Follow\-up CSM Task button is not visible"
  end
end

Then(/^I should see Success Plan Play lookup field with read and write permission$/) do
  if page.has_field?("CF00N3600000PVNwd")
    puts "Success Plan Play field is editable"
  else
    writeFailure "Success Plan Play field is not visible"
  end
end


Then(/^I should see Set Play Outcome button$/) do
  if page.has_xpath?(".//*[@id='topButtonRow']/input[@value='Set Play Outcome']")
    puts "Set Play Outcome button is visible"
  else
    writeFailure "Set Play Outcome button is not visible"
  end
end

Then(/^I should not see Create Follow\-Up Event button$/) do
  if page.has_xpath?(".//*[@id='topButtonRow']/input[@value='Create Follow-Up Task']")
    writeFailure "Create Follow\-Up Event button is  visible"
  else
    puts "Create Follow\-Up Event button is not visible"
  end
end

When(/^I select "([^"]*)" from record type of new record$/) do |arg1|
  select arg1, :from => "Record Type of new record"
  sleep 3
  if find(:button,'Continue').visible?
    sleep 2
    click_on('Continue')
    puts "clicked on continue button"
  else
    puts "Continue button is not available for this user"
  end
end

Then(/^I check that the picklist value of record type of new record$/) do
  #    if page.has_xpath?(".//*[@id='p3']/option[@value='Task - Health Check']")
  #  if page.has_xpath?("//select[@id='p3']/option[@value='012R0000000DIYO']")
  sleep 2
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Task - Standard']")
    puts "Record Type of new record picklist contains Task - Standard option"
  else
    writeFailure "Record Type of new record picklist does not contain Task - Standard option"
  end
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Task - Email']")
    puts "Record Type of new record picklist contains Task - Email option"
  else
    writeFailure "Record Type of new record picklist does not contain Task - Email"
  end
  sleep 2
  if page.has_xpath?("//select[@id='p3']/option[text() = 'Task - Phone Calls']")
    puts "Record Type of new record picklist contains Task - Phone Calls option"
  else
    writeFailure "Record Type of new record picklist does not contain Task - Phone Calls option"
  end
end


When(/^I enter data to all the mandatory fields to create task email$/) do
  fill_in "Due Date",:with => "10/7/2017"
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Assigned To Lookup (New Window)']").click
  sleep 15
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 15
  if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "opsmgrprod") || (ENV['UserRole'] == "opsrepprod")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesopssit") || (ENV['UserRole'] == "salesrepprod") || (ENV['UserRole'] == "salesmgrprod") || (ENV['UserRole'] == "salesopsprod")
      fill_in("lksrch",:with=> "Sales")
    else
      if (ENV['UserRole'] == "Adminsit") || (ENV['UserRole'] == "Adminprod")
        fill_in("lksrch",:with=> "DSIntegration")
      end
    end
  end
  sleep 15
  find_button('Go!').click
  sleep 10
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    sleep 10
    if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsmgrprod")
      #      click_on "Operations Manager CiscoAdopt NALA"
      click_on "Operations Manager Google"
      puts "assigned to Operations Manager Google"
      sleep 10
    else if (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "opsrepprod")
        click_on "Operations Rep Google"
        puts "assigned to Operations Rep Google"
        sleep 10
      else if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesmgrprod")
          click_on "Sales Manager Google"
          puts "assigned to Sales Manager Google"
          sleep 10
        else if (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesrepprod")
            click_on "Sales Rep Google"
            puts "assigned to Sales Rep Google"
            sleep 10
          else if (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "Adminprod")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 10
            else if (ENV['UserRole'] == "salesopssit") || (ENV['UserRole'] == "salesopsprod")
                click_on "Sales Ops Google"
                puts "assigned to Sales Ops Google"
                sleep 10
              end
            end
          end
        end
      end
    end
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  #to choose accounts
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Name Lookup (New Window)']").click
  sleep 20
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
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
  sleep 10

  #to choose opportunity
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 15
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-opportunity-")
  sleep 15
  find_button('Go!').click
  sleep 15
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  within all(".pbSubsection")[0] do
    if page.has_field?("Priority")
      select("Normal", :from => "Priority")
    end
    if page.has_field?("Status")
      select("Not Started", :from => "Status")
    end
  end
  within all(".pbSubsection")[2] do
    $newtaskemail = "smoke-test-Task-Email-" + Random.new.rand(10000..20000).to_s
    puts $newtaskemail
    fill_in "Comments",:with => "Call"
    sleep 5
    fill_in "Subject", :with => $newtaskemail
    if page.has_field?("Direction")
      select("Incoming", :from => "Direction")
    end
  end
end

When(/^I click on any existing newly created task email in my task section$/) do
  sleep 20
  select("All Open", :from => "tasklist_mode")
  sleep 5
  sleep 5
  puts "searching view more link"
  if page.has_xpath?("//a[contains(text(),'View More')]")
    find(:xpath, "//a[contains(text(),'View More')]").click
  else
    puts "No view more link is available"
  end
  sleep 40
  #  within  all(".pbBody")[1] do
  #    sleep 2
  #    puts $newtaskemail
  #    find_link($newtaskemail).visible?
  #    click_link($newtaskemail)
  #    sleep 5
  #  end
  click_link($newtaskemail)
  sleep 5
end

When(/^I click on any existing newly created task phone call in my task section$/) do
  sleep 20
  select("All Open", :from => "tasklist_mode")
  sleep 5
  sleep 5
  puts "searching view more link"
  if page.has_xpath?("//a[contains(text(),'View More')]")
    find(:xpath, "//a[contains(text(),'View More')]").click
  else
    puts "No view more link is available"
  end
  sleep 40
  #  within  all(".pbBody")[1] do
  #    sleep 2
  #    puts $newtaskphonecalls
  #    find_link($newtaskphonecalls).visible?
  #    click_link($newtaskphonecalls)
  #    sleep 5
  #  end
  click_link($newtaskphonecalls)
  sleep 5
end

When(/^I click on any existing newly created task standard in my task section$/) do
  sleep 20
  select("All Open", :from => "tasklist_mode")
  sleep 5
  sleep 5
  puts "searching view more link"
  if page.has_xpath?("//a[contains(text(),'View More')]")
    find(:xpath, "//a[contains(text(),'View More')]").click
  else
    puts "No view more link is available"
  end
  sleep 40
  #  within  all(".pbBody")[1] do
  #    sleep 2
  #    puts $newtaskstandard
  #    find_link($newtaskstandard).visible?
  #    click_link($newtaskstandard)
  #    sleep 5
  #  end
  click_link($newtaskstandard)
  sleep 5
end

When(/^I enter data to all the mandatory fields to create task phone calls$/) do
  fill_in "Due Date",:with => "10/7/2017"
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Assigned To Lookup (New Window)']").click
  sleep 15
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 15
  if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "opsmgrprod") || (ENV['UserRole'] == "opsrepprod")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesopssit") || (ENV['UserRole'] == "salesrepprod") || (ENV['UserRole'] == "salesmgrprod") || (ENV['UserRole'] == "salesopsprod")
      fill_in("lksrch",:with=> "Sales")
    else
      if (ENV['UserRole'] == "Adminsit") || (ENV['UserRole'] == "Adminprod")
        fill_in("lksrch",:with=> "DSIntegration")
      end
    end
  end
  sleep 15
  find_button('Go!').click
  sleep 10
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    sleep 10
    if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsmgrprod")
      #      click_on "Operations Manager CiscoAdopt NALA"
      click_on "Operations Manager Google"
      puts "assigned to Operations Manager Google"
      sleep 10
    else if (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "opsrepprod")
        click_on "Operations Rep Google"
        puts "assigned to Operations Rep Google"
        sleep 10
      else if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesmgrprod")
          click_on "Sales Manager Google"
          puts "assigned to Sales Manager Google"
          sleep 10
        else if (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesrepprod")
            click_on "Sales Rep Google"
            puts "assigned to Sales Rep Google"
            sleep 10
          else if (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "Adminprod")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 10
            else if (ENV['UserRole'] == "salesopssit") || (ENV['UserRole'] == "salesopsprod")
                click_on "Sales Ops Google"
                puts "assigned to Sales Ops Google"
                sleep 10
              end
            end
          end
        end
      end
    end
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  #to choose accounts
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Name Lookup (New Window)']").click
  sleep 10
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
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
  sleep 10

  #to choose opportunity
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 15
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-opportunity-")
  sleep 15
  find_button('Go!').click
  sleep 15
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  within all(".pbSubsection")[0] do
    if page.has_field?("Priority")
      select("Normal", :from => "Priority")
    end
    if page.has_field?("Status")
      select("Not Started", :from => "Status")
    end
  end
  within all(".pbSubsection")[2] do
    $newtaskphonecalls = "smoke-test-task-phone-calls-" + Random.new.rand(10000..20000).to_s
    puts $newtaskphonecalls
    fill_in "Comments",:with => "Call"
    sleep 5
    fill_in "Subject", :with => $newtaskphonecalls
    if page.has_field?("Direction")
      select("Incoming", :from => "Direction")
    end
  end
end

When(/^I enter data to all the mandatory fields to create task standard$/) do
  fill_in "Due Date",:with => "10/7/2017"
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Assigned To Lookup (New Window)']").click
  sleep 15
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 15
  if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "opsmgrprod") || (ENV['UserRole'] == "opsrepprod")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesopssit") || (ENV['UserRole'] == "salesrepprod") || (ENV['UserRole'] == "salesmgrprod") || (ENV['UserRole'] == "salesopsprod")
      fill_in("lksrch",:with=> "Sales")
    else
      if (ENV['UserRole'] == "Adminsit") || (ENV['UserRole'] == "Adminprod")
        fill_in("lksrch",:with=> "DSIntegration")
      end
    end
  end
  sleep 15
  find_button('Go!').click
  sleep 10
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    sleep 10
    if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsmgrprod")
      #      click_on "Operations Manager CiscoAdopt NALA"
      click_on "Operations Manager Google"
      puts "assigned to Operations Manager Google"
      sleep 10
    else if (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "opsrepprod")
        click_on "Operations Rep Google"
        puts "assigned to Operations Rep Google"
        sleep 10
      else if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesmgrprod")
          click_on "Sales Manager Google"
          puts "assigned to Sales Manager Google"
          sleep 10
        else if (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesrepprod")
            click_on "Sales Rep Google"
            puts "assigned to Sales Rep Google"
            sleep 10
          else if (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "Adminprod")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 10
            else if (ENV['UserRole'] == "salesopssit") || (ENV['UserRole'] == "salesopsprod")
                click_on "Sales Ops Google"
                puts "assigned to Sales Ops Google"
                sleep 10
              end
            end
          end
        end
      end
    end
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  #to choose accounts
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Name Lookup (New Window)']").click
  sleep 10
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
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
  sleep 10

  #to choose opportunity
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 15
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-opportunity-")
  sleep 15
  find_button('Go!').click
  sleep 15
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  within all(".pbSubsection")[0] do
    if page.has_field?("Priority")
      select("Normal", :from => "Priority")
    end
    if page.has_field?("Status")
      select("Not Started", :from => "Status")
    end
  end
  within all(".pbSubsection")[2] do
    $newtaskstandard = "smoke-test-task-standard-" + Random.new.rand(10000..20000).to_s
    puts $newtaskstandard
    fill_in "Comments",:with => "Call"
    sleep 5
    fill_in "Subject", :with => $newtaskstandard
    if page.has_field?("Direction")
      select("Incoming", :from => "Direction")
    end
  end
end

Then(/^I enter data to all the mandatory fields$/) do
  fill_in "Due Date",:with => "10/7/2017"
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Assigned To Lookup (New Window)']").click
  sleep 15
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 15
  if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "opsmgrprod") || (ENV['UserRole'] == "opsrepprod")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesopssit") || (ENV['UserRole'] == "salesrepprod") || (ENV['UserRole'] == "salesmgrprod") || (ENV['UserRole'] == "salesopsprod")
      fill_in("lksrch",:with=> "Sales")
    else
      if (ENV['UserRole'] == "Adminsit") || (ENV['UserRole'] == "Adminprod")
        fill_in("lksrch",:with=> "DSIntegration")
      end
    end
  end
  sleep 15
  find_button('Go!').click
  sleep 10
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    sleep 10
    if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsmgrprod")
      #      click_on "Operations Manager CiscoAdopt NALA"
      click_on "Operations Manager Google"
      puts "assigned to Operations Manager Google"
      sleep 10
    else if (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "opsrepprod")
        click_on "Operations Rep Google"
        puts "assigned to Operations Rep Google"
        sleep 10
      else if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesmgrprod")
          click_on "Sales Manager Google"
          puts "assigned to Sales Manager Google"
          sleep 10
        else if (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesrepprod")
            click_on "Sales Rep Google"
            puts "assigned to Sales Rep Google"
            sleep 10
          else if (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "Adminprod")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 10
            else if (ENV['UserRole'] == "salesopssit") || (ENV['UserRole'] == "salesopsprod")
                click_on "Sales Ops Google"
                puts "assigned to Sales Ops Google"
                sleep 10
              end
            end
          end
        end
      end
    end
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  #to choose accounts
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Name Lookup (New Window)']").click
  sleep 10
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
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
  sleep 10

  #to choose opportunity
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 15
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-opportunity-")
  sleep 15
  find_button('Go!').click
  sleep 15
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  within all(".pbSubsection")[0] do
    if page.has_field?("Priority")
      select("Normal", :from => "Priority")
    end   
    if page.has_field?("Status")
      select("Not Started", :from => "Status")
    end
  end  
  within all(".pbSubsection")[2] do
    $newtask = "smoke-test-Task-Email-" + Random.new.rand(10000..20000).to_s
    puts $newtask
    fill_in "Comments",:with => "Call"
    sleep 5
    fill_in "Subject", :with => $newtask
    if page.has_field?("Direction")
      select("Incoming", :from => "Direction")
    end
  end
end

Then(/^I should see at risk reason picklist under health check details section$/) do
  if page.has_select?("00N3600000PVaDh", :selected => "--None--")
    puts "risk reason field is editable"
  else
    puts "risk reason field is not picklist"
  end
end

Then(/^I should verify risk reason picklist field permission except sales ops$/) do
  step 'I should see at risk reason picklist under health check details section'
  sleep 2
end

Then(/^I should verify risk reason picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PVaDh']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "One-Time Project", "Project Cancelled", "Competitive Product Replacement - Price","Competitive Product Replacement - Features", "Lack of Perceived Value", "Product Complexity","Loss of Internal Sponsor", "Over Sold", "Loss of Budget", "Merger/Acquistion", "Bankruptcy", "Out of Business","Low Adoption", "Project Delayed", "Test/Dev Environment", "Product Decommissioned", "Initial Expectation Issues", "Customer Satisfaction Driven - Support","Unresponsive End User", "Training Gaps", "Seasonal Use", "No Updates Needed", "Customer @ Industry Standard","Upsell/Cross Sell Opportunity", "Customer Implementing APIs", "Customer Increasing End Points", "Early Renewal"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in risk reason picklist"
  else
    writeFailure "expected values are not visible in risk reason picklist"
  end
end

Then(/^I should see Achieved APIs multiple picklist$/) do
  if page.has_field?("00N3600000PVaDX_unselected")
    puts "Achieved APIs field is editable"
  else
    puts "Achieved APIs field is not picklist"
  end
end

Then(/^I should verify Achieved APIs multiple picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PVaDX_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues =  ["MapLoads - SREV", "StaticMaps - SREV", "StreetView - SREV", "MobileMapLoads - SREV", "PlacesSearch - SREV", "PlacesAutocomplete - SREV", "Geocoding - SREV", "Directions - SREV", "Elevation - SREV", "Timezone - SREV", "Geolocation - SREV", "Roads - SREV", "DistanceMatrix - SREV", "MapLoads - Non SREV", "StaticMaps - Non SREV", "StreetView - Non SREV", "MobileMapLoads - Non SREV", "PlacesSearch - Non SREV", "PlacesAutocomplete - Non SREV", "Geocoding - Non SREV", "Directions - Non SREV", "Elevation - Non SREV", "Timezone - Non SREV", "Geolocation - Non SREV", "Roads - Non SREV", "DistanceMatrix - Non SREV"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Achieved APIs multiple picklist"
  else
    writeFailure "expected values are not visible in Achieved APIs multiple picklist"
  end
end

Then(/^I should see Desired APIs multiple picklist$/) do
  if page.has_field?("00N3600000PVaDY_unselected")
    puts "Desired APIs field is editable"
  else
    puts "Desired APIs field is not picklist"
  end
end

Then(/^I should verify Desired APIs multiple picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PVaDY_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["MapLoads - SREV", "StaticMaps - SREV", "StreetView - SREV", "MobileMapLoads - SREV", "PlacesSearch - SREV", "PlacesAutocomplete - SREV" , "Geocoding - SREV", "Directions - SREV", "Elevation - SREV", "Timezone - SREV" , "Geolocation - SREV", "Roads - SREV", "DistanceMatrix - SREV","MapLoads - Non SREV", "StaticMaps - Non SREV", "StreetView - Non SREV", "MobileMapLoads - Non SREV", "PlacesSearch - Non SREV", "PlacesAutocomplete - Non SREV", "Geocoding - Non SREV", "Directions - Non SREV", "Elevation - Non SREV","Timezone - Non SREV", "Geolocation - Non SREV", "Roads - Non SREV", "DistanceMatrix - Non SREV"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in Desired APIs multiple picklist"
  else
    writeFailure "expected values are not visible in Desired APIs multiple picklist"
  end
end

Then(/^I should see Use Cases multiple picklist$/) do
  if page.has_field?("00N3600000PVaDZ_unselected")
    puts "Use Cases field is editable"
  else
    puts "Use Cases field is not picklist"
  end
end

When(/^I click on any existing newly created task in my task section$/) do
  sleep 20
  select("All Open", :from => "tasklist_mode")
  sleep 5
  sleep 5
  puts "searching view more link"
  if page.has_xpath?("//a[contains(text(),'View More')]")
    find(:xpath, "//a[contains(text(),'View More')]").click
  else
    puts "No view more link is available"
  end
  sleep 40
#  within  all(".pbBody")[1] do
#    sleep 2
#    puts $newtask
#    find_link($newtask).visible?
#    click_link($newtask)
#    sleep 5
#  end
click_link($newtask)
    sleep 5
end

Then(/^I should verify Use Cases multiple picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PVaDZ_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues =  ["Taxis and Ride Sharing", "Fleet Management", "Tracking and Safety", "Locator", "Last Mile Delivery", "Field Force Management", "Mobile Device Management", "Other", "Interactive Driving", "Vehicle Shopping", "Store locator", "Real Estate", "Bank/ATM Locator", "CRM", "Health Insurance", "Acounting and Auditing", "Credit & Lending", "Jobs Platform / Recruiting", "Security validation", "Public Safety/Emergency Management", "Online travel / retailer", "Natural Resource/Environmental Modeling", "Transportation", "Public Works", "Public Safety", "GIS Planning", "Bookings", "Hotel finder", "Travel planner", "Locator (e.g. Dealer Locator)", "Internal Users", "Product Finder", "Heatmaps / Footfall Analytics", "Vehicle Tracking", "Ad campaigns", "Thematic Maps", "Events and Listings", "Fantasy Sports", "Customer intelligence", "Doctor/Patient Finder", "Internet of Things", "Heat mapping", "Internal customer data base", "Social Networking / Internet Chat", "Genral Reference", "Property Finder", "Workforce Management", "Data visualisation", "Stock control/management", "Network/pipeline mapping/management", "Customer Online Checkout", "Physical store / hotel locators", "Customer delivery", "E-commerce", "Retail Distribution", "Infrastructure management", "Coverage / Outage Maps", "Radio Equipment", "Assistance and Route Planner", "End to End Journey Planner", "Travel Guide", "Business Intelligence/Data visualisation", "Customer service", "Click-and-collect", "Internal delivery driver co-ordination", "Booking Platform"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Use Cases multiple picklist"
  else
    writeFailure "expected values are not visible in Use Cases multiple picklist"
  end
end

Then(/^I should see Achieved End Points multiple picklist$/) do
  if page.has_field?("00N3600000PVaDa_unselected")
    puts "Achieved End Points field is editable"
  else
    puts "Achieved End Points field is not picklist"
  end
end

Then(/^I should verify Achieved End Points multiple picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PVaDa_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues =  ["jsDirections - SREV", "jsDistanceMatrix - SREV", "jsElevation - SREV", "jsGeocoding - SREV", "jsMapLoads - SREV", "jsPlacesAutocomplete - SREV", "jsPlacesSearch - SREV", "jsMobileMapLoads - SREV", "jsStaticMaps - SREV", "jsStreetView - SREV", "wsDirections - SREV", "wsDistanceMatrix - SREV", "wsElevation - SREV", "wsGeocoding - SREV", "wsGeolocation - SREV", "wsPlacesAutocomplete - SREV", "wsPlacesSearch - SREV", "wsRoads - SREV", "wsTimezone - SREV", "jsDirections - Non SREV", "jsDistanceMatrix - Non SREV", "jsElevation - Non SREV", "jsGeocoding - Non SREV", "jsMapLoads - Non SREV", "jsPlacesAutocomplete - Non SREV", "jsPlacesSearch - Non SREV", "jsMobileMapLoads - Non SREV", "jsStaticMaps - Non SREV", "jsStreetView - Non SREV", "wsDirections - Non SREV", "wsDistanceMatrix - Non SREV", "wsElevation - Non SREV", "wsGeocoding - Non SREV", "wsGeolocation - Non SREV", "wsPlacesAutocomplete - Non SREV", "wsPlacesSearch - Non SREV", "wsRoads - Non SREV", "wsTimezone - Non SREV"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Achieved End Points multiple picklist"
  else
    writeFailure "expected values are not visible in Achieved End Points multiple picklist"
  end
end

Then(/^I should see Desired End Points multiple picklist$/) do
  if page.has_field?("00N3600000PVaDb_unselected")
    puts "Desired End Points field is editable"
  else
    puts "Desired End Points field is not picklist"
  end
end

Then(/^I should verify Desired End Points multiple picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PVaDb_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues =  ["jsDirections - SREV", "jsDistanceMatrix - SREV", "jsElevation - SREV", "jsGeocoding - SREV", "jsMapLoads - SREV", "jsPlacesAutocomplete - SREV", "jsPlacesSearch - SREV", "jsMobileMapLoads - SREV", "jsStaticMaps - SREV", "jsStreetView - SREV", "wsDirections - SREV", "wsDistanceMatrix - SREV", "wsElevation - SREV", "wsGeocoding - SREV", "wsGeolocation - SREV", "wsPlacesAutocomplete - SREV", "wsPlacesSearch - SREV", "wsRoads - SREV", "wsTimezone - SREV", "jsDirections - Non SREV", "jsDistanceMatrix - Non SREV", "jsElevation - Non SREV", "jsGeocoding - Non SREV", "jsMapLoads - Non SREV", "jsPlacesAutocomplete - Non SREV", "jsPlacesSearch - Non SREV", "jsMobileMapLoads - Non SREV", "jsStaticMaps - Non SREV", "jsStreetView - Non SREV", "wsDirections - Non SREV", "wsDistanceMatrix - Non SREV", "wsElevation - Non SREV", "wsGeocoding - Non SREV", "wsGeolocation - Non SREV", "wsPlacesAutocomplete - Non SREV", "wsPlacesSearch - Non SREV", "wsRoads - Non SREV", "wsTimezone - Non SREV"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Desired End Points multiple picklist"
  else
    writeFailure "expected values are not visible in Desired End Points multiple picklist"
  end
end

Then(/^I should see health check picklist$/) do
  if page.has_field?("00N3600000PVaDi")
    puts "health check field is editable"
  else
    puts "health check field is not picklist"
  end
end

Then(/^I should verify health check picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PVaDi']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "1", "2", "3", "4", "5", "6", "7", "8", "9","10"]
  puts "expected values = #{expectedvalues}"
  if actualvalues == expectedvalues
    puts "expected values are visible in health check picklist"
  else
    writeFailure "expected values are not visible in health check picklist"
  end
end

Then(/^I should see contact lookup field$/) do
  if page.has_field?("Contact")
    puts "Contact lookup field is editable"
  else
    puts "Contact field is not visible"
  end
end

When(/^I enter all mandantory field to create a new task with health check task$/) do
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Assigned To Lookup (New Window)']").click
  sleep 15
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 15
  if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "opsmgrprod") || (ENV['UserRole'] == "opsrepprod")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesopssit") || (ENV['UserRole'] == "salesrepprod") || (ENV['UserRole'] == "salesmgrprod") || (ENV['UserRole'] == "salesopsprod")
      fill_in("lksrch",:with=> "Sales")
    else
      if (ENV['UserRole'] == "Adminsit") || (ENV['UserRole'] == "Adminprod")
        fill_in("lksrch",:with=> "DSIntegration")
      end
    end
  end
  sleep 15
  find_button('Go!').click
  sleep 10
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    sleep 10
    if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsmgrprod")
      #      click_on "Operations Manager CiscoAdopt NALA"
      click_on "Operations Manager Google"
      puts "assigned to Operations Manager Google"
      sleep 10
    else if (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "opsrepprod")
        click_on "Operations Rep Google"
        puts "assigned to Operations Rep Google"
        sleep 10
      else if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesmgrprod")
          click_on "Sales Manager Google"
          puts "assigned to Sales Manager Google"
          sleep 10
        else if (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesrepprod")
            click_on "Sales Rep Google"
            puts "assigned to Sales Rep Google"
            sleep 10
          else if (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "Adminprod")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 10
            else if (ENV['UserRole'] == "salesopssit") || (ENV['UserRole'] == "salesopsprod")
                click_on "Sales Ops Google"
                puts "assigned to Sales Ops Google"
                sleep 10
              end
            end
          end
        end
      end
    end
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  #to choose accounts
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Name Lookup (New Window)']").click
  sleep 30
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test-contact-")
  sleep 20
  find_button('Go!').click
  sleep 20
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 20
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 20
  page.driver.browser.switch_to.window(main)
  sleep 10

  #to choose opportunity
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Related To Lookup (New Window)']").click
  sleep 20
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
    table.all('tr')[1].all('th')[0].find('a').click
    sleep 20
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  within all(".pbSubsection")[0] do
    if page.has_field?("Priority")
      select("Normal", :from => "Priority")
    end
    if page.has_field?("Status")
      select("Not Started", :from => "Status")
    end
  end
  within all(".pbSubsection")[2] do
    $subject_1 = "smoke-test-Task-health-check-" + Random.new.rand(10000..20000).to_s
    puts $subject_1
    fill_in "Comments",:with => "Call"
    sleep 5
    fill_in "Subject", :with => $subject_1
    if page.has_field?("Direction")
      select("Incoming", :from => "Direction")
    end
  end
  sleep 3
  #muti select
  page.find_by_id('00N3600000PVaDX_unselected').find("option[value='0']").select_option
  page.find(:id,"00N3600000PVaDX_right_arrow").click
  sleep 3
  fill_in "Due Date",:with => "10/7/2017"
  sleep 3
  page.find_by_id('00N3600000PVaDa_unselected').find("option[value='0']").select_option
  page.find(:id,"00N3600000PVaDa_right_arrow").click
end

When(/^I click on any existing zenith task health check link in my task section$/) do
  sleep 20
  select("All Open", :from => "tasklist_mode")
  sleep 5
  #  within(".bMyTask") do
  #    sleep 2
  #    if page.has_content?("View More >>")
  #      sleep 2
  #      within(".pShowMore") do
  #        find(:xpath, "//a[contains(text(),'View More')]").click
  #      end
  #    else
  #      puts "No view more link is available"
  #    end
  #    sleep 4
  sleep 5
  puts "searching view more link"
  if page.has_xpath?("//a[contains(text(),'View More')]")
    find(:xpath, "//a[contains(text(),'View More')]").click
  else
    puts "No view more link is available"
  end
  sleep 40
#  within  all(".pbBody")[1] do
#    sleep 2
#    puts $subject_1
#    find_link($subject_1).visible?
#    click_link($subject_1)
#    sleep 5
#  end
 click_link($subject_1)
    sleep 5
end

When(/^I select status as "([^"]*)"$/) do |value|
  select(value, :from => "Status")
  sleep 5
end