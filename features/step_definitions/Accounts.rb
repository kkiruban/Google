
Then(/^I should see Vertical picklist values under account details section$/) do
  if page.has_field?("Vertical")
    actualvalues = find_field("Vertical", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","Asset Tracking","Automotive","Financial Services","Manufacturing","Media & Entertainment","Retail & Wholesale Trade","Telecommunications","Travel & Transport","Government","Hospitality/Tourism","Medical/Health Services","Other","B2B","Education","Food Services","Technology","Real Estate","Resources/Energy","Utilities"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Vertical picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Vertical picklist"
    end
  else
    writeFailure "Vertical field not visible"
  end
end

Then(/^I should see Client Theatre picklist values under account details section$/) do
  if page.has_field?("Client Theatre")
    actualvalues = find_field("Client Theatre", match: :prefer_exact).all('option').collect(&:text)
    puts "actual values = #{actualvalues}"
    expectedvalues = ["--None--","APAC","EMEA","NALA"]
    puts "expectedvalues =  #{expectedvalues}"
    if actualvalues.sort == expectedvalues.sort
      puts "expected values are visible in Client Theatre picklist"
    else
      Extravalue = (actualvalues.sort-expectedvalues.sort)
      puts  "Extra value = #{Extravalue}"
      MissingValue = (expectedvalues.sort - actualvalues.sort)
      puts  "Missing Value = #{MissingValue}"
      writeFailure "expected values are not visible in Client Theatre picklist"
    end
  else
    writeFailure "Client Theatre field not visible"
  end
end

Then(/^I should see Vertical picklist field$/) do
  if page.has_field?("00N3600000PVaCv")
    puts "Vertical field is editable"
  else
    puts "Vertical field is not picklist"
  end
end

Then(/^I should see Monthly Achieved API's multiple picklist under new account page$/) do
  if page.has_field?("Monthly Achieved API's")
    puts "Monthly Achieved API's field is editable"
  actualvalues =find(:xpath,".//*[@id='00Ng0000001yTII_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["Directions","DistanceMatrix","Elevation","Geocoding","Geolocation","MapLoads","MobileMapLoads","PageViews","PlacesAutocomplete","PlacesSearch","Roads","StaticMaps","StreetView","Tiles","Timezone"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Monthly Achieved API's multiple picklist"
  else
    writeFailure "expected values are not visible in Monthly Achieved API's multiple picklist"
  end
  else
    writeFailure "Monthly Achieved API's field is not visible"
  end
end

Then(/^I should see Monthly Achieved End Points multiple picklist under new account page$/) do
  if page.has_field?("Monthly Achieved End Points")
    puts "Monthly Achieved End Points field is editable"
  actualvalues =find(:xpath,".//*[@id='00Ng0000001yTID_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["jsDirections","jsDistanceMatrix","jsElevation","jsGeocoding","jsMapLoads","jsPageViews","jsPlacesAutocomplete","jsPlacesSearch","jsMobileMapLoads","jsStaticMaps","jsStreetView","wsDirections","wsDistanceMatrix","wsElevation","wsGeocoding","wsGeolocation","wsPlacesAutocomplete","wsPlacesSearch","wsRoads","wsTimezone","wsTiles"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Monthly Achieved End Points multiple picklist"
  else
    writeFailure "expected values are not visible in Monthly Achieved End Points multiple picklist"
  end
  else
    writeFailure "Monthly Achieved End Points field is not visible"
  end
end

Then(/^I should see Monthly Use Cases multiple picklist under new account page$/) do
  if page.has_field?("Monthly Use Cases")
    puts "Monthly Use Cases field is editable"
  actualvalues =find(:xpath,".//*[@id='00Ng0000001yTIN_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["Coverage / Outage Maps","CRM","Custom & Indoor Streetview","Customer delivery","Customer intelligence","Customer Online Checkout","Customer service","Data visualisation","Doctor/Patient Finder","E-commerce","End to End Journey Planner","Field Force Management","Field Worker","Fleet Management","GIS Planning","Heat mapping","Heatmaps / Footfall Analytics","Hotel finder","Indoor mapping","Infrastructure management","Inspirational Map Deployments","Interactive Driving","Internal customer data base","Internal delivery driver co-ordination","Internal Street View","Internal Users","Internet of Things","Jobs Platform / Recruiting","Last Mile Delivery","Locator","Locator (e.g. Dealer Locator)","Mobile Device Management","Natural Resource/Environmental Modeling","Network/pipeline mapping/management","Online travel / retailer","Other","Physical store / hotel locators","Product Finder","Property Finder","Public Safety/Emergency Management","Public Works","Real Estate","Retail Distribution","Scenic Tour Map","Security validation","sharing Journeys","Social","Social Networking / Internet Chat","Stock control/management","Store locator","Street View","Tax/Appraisal District Assessments","Taxis and Ride Sharing","Thematic Maps","Tracking and Safety","Transportation","Travel Guide","Travel planner","Vehicle Tracking","Workforce Management"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Monthly Use Cases multiple picklist"
  else
    writeFailure "expected values are not visible in Monthly Use Cases multiple picklist"
  end
  else
    writeFailure "Monthly Use Cases field is not visible"
  end
end

Then(/^I should see Monthly Vertical multiple picklist under new account page$/) do
  if page.has_field?("Monthly Vertical")
    puts "Monthly Vertical field is editable"
  actualvalues =find(:xpath,".//*[@id='00Ng0000001yTIS_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["Asset Tracking","Automotive","B2B","Education","Financial Services","Food Services","Government","Hospitality/Tourism","Manufacturing","Media & Entertainment","Medical/Health Services","Other","Real Estate","Resources/Energy","Retail & Wholesale Trade","Technology","Telecommunications","Travel & Transport","Utilities"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Monthly Vertical multiple picklist"
  else
    writeFailure "expected values are not visible in Monthly Vertical multiple picklist"
  end
  else
    writeFailure "Monthly Vertical field is not visible"
  end
end

Then(/^I should verify Vertical picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PVaCv']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "Automotive", "Financial Services", "Manufacturing", "Media and Entertainment", "Retail and Wholesale Trade","Telecommunications", "Travel and Transport", "Asset Tracking", "Government", "Hospitality/Tourism", "Medical/Health Services", "Other", "B2B", "Education","Food Services","Technology", "Real Estate", "Resources/Energy", "Utilities"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Vertical picklist"
  else
    writeFailure "expected values are not visible in Vertical picklist"
  end
end


Then(/^I should see Client Theatre picklist field$/) do
  if page.has_field?("00Ng00000024qqj")
    puts "Client Theatre field is editable"
  else
    writeFailure "Client Theatre field is not visible"
  end
end

Then(/^I should verify Client Theatre picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00Ng00000024qqj']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "APAC", "EMEA", "NALA"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Client Theatre picklist"
  else
    writeFailure "expected values are not visible in Client Theatre picklist"
  end
end

Then(/^I should see At Risk Reason picklist field$/) do
  if page.has_field?("00N3600000PVaCw")
    puts "At Risk Reason field is editable"
  elsif page.has_content?('At Risk Reason')
    puts "At Risk Reason field is readable"
  else
    writeFailure "At Risk Reason field is not visible"
  end
end

Then(/^I should verify At Risk Reason picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PVaCw']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "One-Time Project", "Project Cancelled", "Competitive Product Replacement - Price", "Competitive Product Replacement - Features", "Lack of Perceived Value", "Product Complexity", "Loss of Internal Sponsor", "Over Sold", "Loss of Budget", "Merger/Acquistion", "Bankruptcy", "Out of Business", "Low Adoption", "Project Delayed", "Test/Dev Environment", "Product Decommissioned", "Initial Expectation Issues", "Customer Satisfaction Driven - Support", "Unresponsive End User", "Training Gaps", "Seasonal Use", "No Updates Needed", "Customer @ Industry Standard", "Upsell/Cross Sell Opportunity", "Customer Implementing APIs", "Customer Increasing End Points", "Early Renewal"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in At Risk Reason picklist"
  else
    writeFailure "expected values are not visible in At Risk Reason picklist"
  end
end

Then(/^I should see client id field$/) do
  if page.has_field?("00N3600000PVaD0")
    puts "client id field is editable"
  elsif page.has_content?('Client ID')
    puts "client id field is readable"
  else
    writeFailure "client id field is not visible"
  end
end

Then(/^I should see Achieved APIs multiple picklist under new account page$/) do
  if page.has_field?("00Ng00000026m4k_unselected")
    puts "Achieved APIs field is editable"
  else
    writeFailure "Achieved APIs field is not picklist"
  end

end

Then(/^I should verify Achieved APIs multiple picklist values under new account page$/) do
  actualvalues =find(:xpath,".//*[@id='00Ng00000026m4k_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["MapLoads - SREV", "StaticMaps - SREV", "StreetView - SREV", "MobileMapLoads - SREV", "PlacesSearch - SREV","PlacesAutocomplete - SREV", "Geocoding - SREV", "Directions - SREV", "Elevation - SREV", "Timezone - SREV","Geolocation - SREV", "Roads - SREV", "DistanceMatrix - SREV", "MapLoads - Non SREV", "StaticMaps - Non SREV","StreetView - Non SREV", "MobileMapLoads - Non SREV", "PlacesSearch - Non SREV", "PlacesAutocomplete - Non SREV","Geocoding -Non SREV", "Directions - Non SREV", "Elevation - Non SREV", "Timezone - Non SREV", "Geolocation - Non SREV","Roads - Non SREV", "DistanceMatrix - Non SREV"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Achieved APIs multiple picklist"
  else
    writeFailure "expected values are not visible in Achieved APIs multiple picklist"
  end
end

Then(/^I should see Desired APIs multiple picklist under new account page$/) do
  if page.has_field?("00Ng00000026m4p_unselected")
    puts "Desired APIs field is editable"
  else
    writeFailure "Desired APIs field is not picklist"
  end
end

Then(/^I should verify Desired APIs multiple picklist values under new account page$/) do
  actualvalues =find(:xpath,".//*[@id='00Ng00000026m4p_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["MapLoads - SREV", "StaticMaps - SREV", "StreetView - SREV", "MobileMapLoads - SREV", "PlacesSearch - SREV", "PlacesAutocomplete - SREV" , "Geocoding - SREV", "Directions - SREV", "Elevation - SREV", "Timezone - SREV" , "Geolocation - SREV", "Roads - SREV", "DistanceMatrix - SREV","MapLoads - Non SREV", "StaticMaps - Non SREV", "StreetView - Non SREV", "MobileMapLoads - Non SREV", "PlacesSearch - Non SREV", "PlacesAutocomplete - Non SREV", "Geocoding - Non SREV", "Directions - Non SREV", "Elevation - Non SREV","Timezone - Non SREV", "Geolocation - Non SREV", "Roads - Non SREV", "DistanceMatrix - Non SREV"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Desired APIs multiple picklist"
  else
    writeFailure "expected values are not visible in Desired APIs multiple picklist"
  end
end

Then(/^I should see Use Cases multiple picklist under new account page$/) do
  if page.has_field?("00Ng00000026m54_unselected")
    puts "Use Cases field is editable"
  else
    writeFailure "Use Cases field is not picklist"
  end
end

Then(/^I should verify Use Cases multiple picklist values under new account page$/) do
  actualvalues =find(:xpath,".//*[@id='00Ng00000026m54_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["Taxis and Ride Sharing", "Fleet Management", "Tracking and Safety", "Locator", "Last Mile Delivery", "Field Force Management", "Mobile Device Management", "Other", "Interactive Driving", "Vehicle Shopping", "Store locator", "Real Estate", "Bank/ATM Locator", "CRM", "Health Insurance", "Acounting and Auditing", "Credit & Lending", "Jobs Platform / Recruiting", "Security validation", "Public Safety/Emergency Management", "Online travel / retailer", "Natural Resource/Environmental Modeling", "Transportation", "Public Works", "Public Safety", "GIS Planning", "Bookings", "Hotel finder", "Travel planner", "Locator (e.g. Dealer Locator)", "Internal Users", "Product Finder", "Heatmaps / Footfall Analytics", "Vehicle Tracking", "Ad campaigns", "Thematic Maps", "Events and Listings", "Fantasy Sports", "Customer intelligence", "Doctor/Patient Finder", "Internet of Things", "Heat mapping", "Internal customer data base", "Social Networking / Internet Chat", "Genral Reference", "Property Finder", "Workforce Management", "Data visualisation", "Stock control/management", "Network/pipeline mapping/management", "Customer Online Checkout", "Physical store / hotel locators", "Customer delivery", "E-commerce", "Retail Distribution", "Infrastructure management", "Coverage / Outage Maps", "Radio Equipment", "Assistance and Route Planner", "End to End Journey Planner", "Travel Guide", "Business Intelligence/Data visualisation", "Customer service", "Click-and-collect", "Internal delivery driver co-ordination", "Booking Platform"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Use Cases multiple picklist"
  else
    writeFailure "expected values are not visible in Use Cases multiple picklist"
  end
end

Then(/^I should see Achieved End Points multiple picklist under new account page$/) do
  if page.has_field?("00Ng00000026m4u_unselected")
    puts "Achieved End Points field is editable"
  else
    writeFailure "Achieved End Points field is not picklist"
  end
end

Then(/^I should verify Achieved End Points multiple picklist values under new account page$/) do
  actualvalues =find(:xpath,".//*[@id='00Ng00000026m4u_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["jsDirections - SREV", "jsDistanceMatrix - SREV", "jsElevation - SREV", "jsGeocoding - SREV", "jsMapLoads - SREV", "jsPlacesAutocomplete - SREV", "jsPlacesSearch - SREV", "jsMobileMapLoads - SREV", "jsStaticMaps - SREV", "jsStreetView - SREV", "wsDirections - SREV", "wsDistanceMatrix - SREV", "wsElevation - SREV", "wsGeocoding - SREV", "wsGeolocation - SREV", "wsPlacesAutocomplete - SREV", "wsPlacesSearch - SREV", "wsRoads - SREV", "wsTimezone - SREV", "jsDirections - Non SREV", "jsDistanceMatrix - Non SREV", "jsElevation - Non SREV", "jsGeocoding - Non SREV", "jsMapLoads - Non SREV", "jsPlacesAutocomplete - Non SREV", "jsPlacesSearch - Non SREV", "jsMobileMapLoads - Non SREV", "jsStaticMaps - Non SREV", "jsStreetView - Non SREV", "wsDirections - Non SREV", "wsDistanceMatrix - Non SREV", "wsElevation - Non SREV", "wsGeocoding - Non SREV", "wsGeolocation - Non SREV", "wsPlacesAutocomplete - Non SREV", "wsPlacesSearch - Non SREV", "wsRoads - Non SREV", "wsTimezone - Non SREV"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Achieved End Points multiple picklist"
  else
    writeFailure "expected values are not visible in Achieved End Points multiple picklist"
  end
end

Then(/^I should see Desired End Points multiple picklist under new account page$/) do
  if page.has_field?("00Ng00000026m4z_unselected")
    puts "Desired End Points field is editable"
  else
    writeFailure "Desired End Points field is not picklist"
  end
end

Then(/^I should verify Desired End Points multiple picklist values under new account page$/) do
  actualvalues =find(:xpath,".//*[@id='00Ng00000026m4z_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues =  ["jsDirections - SREV", "jsDistanceMatrix - SREV", "jsElevation - SREV", "jsGeocoding - SREV", "jsMapLoads - SREV", "jsPlacesAutocomplete - SREV", "jsPlacesSearch - SREV", "jsMobileMapLoads - SREV", "jsStaticMaps - SREV", "jsStreetView - SREV", "wsDirections - SREV", "wsDistanceMatrix - SREV", "wsElevation - SREV", "wsGeocoding - SREV", "wsGeolocation - SREV", "wsPlacesAutocomplete - SREV", "wsPlacesSearch - SREV", "wsRoads - SREV", "wsTimezone - SREV", "jsDirections - Non SREV", "jsDistanceMatrix - Non SREV", "jsElevation - Non SREV", "jsGeocoding - Non SREV", "jsMapLoads - Non SREV", "jsPlacesAutocomplete - Non SREV", "jsPlacesSearch - Non SREV", "jsMobileMapLoads - Non SREV", "jsStaticMaps - Non SREV", "jsStreetView - Non SREV", "wsDirections - Non SREV", "wsDistanceMatrix - Non SREV", "wsElevation - Non SREV", "wsGeocoding - Non SREV", "wsGeolocation - Non SREV", "wsPlacesAutocomplete - Non SREV", "wsPlacesSearch - Non SREV", "wsRoads - Non SREV", "wsTimezone - Non SREV"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Desired End Points multiple picklist"
  else
    writeFailure "expected values are not visible in Desired End Points multiple picklist"
  end
end

Then(/^I should verify Monthly Achieved End Points picklist values under new account page$/) do
  actualvalues =find(:xpath,".//*[@id='00Ng0000001yTID_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues =  ["jsDirections","jsDistanceMatrix","jsElevation","jsGeocoding","jsMapLoads","jsPageViews","jsPlacesAutocomplete","jsPlacesSearch","jsMobileMapLoads","jsStaticMaps","jsStreetView","wsDirections","wsDistanceMatrix","wsElevation","wsGeocoding","wsGeolocation","wsPlacesAutocomplete","wsPlacesSearch","wsRoads","wsTimezone","wsTiles"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Monthly Achieved End Points multiple picklist"
  else
    writeFailure "expected values are not visible in Monthly Achieved End Points multiple picklist"
  end
end

Then(/^I should verify Monthly Achieved API's picklist values under new account page$/) do
  actualvalues =find(:xpath,".//*[@id='00Ng0000001yTII_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues =  ["Directions","DistanceMatrix","Elevation","Geocoding","Geolocation","MapLoads","MobileMapLoads","PageViews","PlacesAutocomplete","PlacesSearch","Roads","StaticMaps","StreetView","Tiles","Timezone"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Monthly Achieved API's multiple picklist"
  else
    writeFailure "expected values are not visible in Monthly Achieved API's multiple picklist"
  end
end

Then(/^I should verify Monthly Vertical multiple picklist values under new account page$/) do
  actualvalues =find(:xpath,".//*[@id='00Ng0000001yTIS_unselected']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues =  ["Asset Tracking","Automotive","B2B","Education","Financial Services","Food Services","Government","Hospitality/Tourism","Manufacturing","Media & Entertainment","Medical/Health Services","Other","Real Estate","Resources/Energy","Retail & Wholesale Trade","Technology","Telecommunications","Travel & Transport","Utilities"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Monthly Vertical multiple picklist"
  else
    writeFailure "expected values are not visible in Monthly Vertical multiple picklist"
  end
end
