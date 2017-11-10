#Step definition to enter the credentials in Emea login page
When(/^I enter the credentials to the Zenith application$/) do
  visit($BASE_URL)
  sleep 20
  def getcredentialinfo
    yamlinput = "./features/config/Login.yml"
    myoptions = YAML.load_file(yamlinput)
    myoptions[ENV['UserRole']]
  end
  value =getcredentialinfo
  fill_in('username', :with => value["Username"])
  fill_in('password', :with => value["Password"])
  find(:id,"Login").click
  sleep 30
end

Given(/^I should navigate to Home tab in saleforce application$/) do
  visit($BASE_URL)
  sleep 15
  def getcredentialinfo
    yamlinput = "./features/config/Login.yml"
    myoptions = YAML.load_file(yamlinput)
    myoptions[ENV['UserRole']]
  end
  value =getcredentialinfo
  fill_in('username', :with => value["Username"])
  fill_in('password', :with => value["Password"])
  find(:id,"Login").click
  sleep 30
end


Given(/^I should navigate to opportunity tab in saleforce application$/) do
  visit($BASE_URL)
  sleep 15
  def getcredentialinfo
    yamlinput = "./features/config/Login.yml"
    myoptions = YAML.load_file(yamlinput)
    myoptions[ENV['UserRole']]
  end
  value =getcredentialinfo
  fill_in('username', :with => value["Username"])
  fill_in('password', :with => value["Password"])
  find(:id,"Login").click
  sleep 20
  find(:xpath,".//*[@id='AllTab_Tab']/a/img").click
  sleep 5
  find(:xpath,"//a[@class='listRelatedObject opportunityBlock title']").click
  sleep 5
end

Then(/^I should see salesforce Home page succesfully$/) do
  $pageTitle = page.title
  puts "current page title = #{$pageTitle}"
  if $pageTitle == "Salesforce - Performance Edition"
     puts "succesfully visited home page"
  else
     puts "Not visited home page successfully"
  end
end

Then(/^I should see the following:$/) do |text|
 page.should have_content(text)
end
