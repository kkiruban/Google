require 'rubygems'
require 'rspec/expectations'
require 'Capybara'

def getCredentialInfo 
  yamlinput = "./features/support/test_data/Login.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[ENV['UserRole']]
end

def getCredentialInfo1
  yamlinput = "./features/support/test_data/Login.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[ENV['UserRole']]
end

def getOpportunityAssetInfo
    yamlinput = "./features/support/test_data/OpportunityAsset.yml"
    myoptions = YAML.load_file(yamlinput)
    myoptions['OpportunityAssetvalues1']
    myoptions['OpportunityAssetvalues2']
    myoptions['Opportunityvalues']
end

def getDetails(yamlInfo)
	yamlinput = "./features/support/test_data/testData_Account.yml"
	myoptions = YAML.load_file(yamlinput)
	myoptions[yamlInfo]
end

def getDetails1(yamlInfo)
	yamlinput = "./features/support/test_data/DataFile.yml"
	myoptions = YAML.load_file(yamlinput)
	myoptions[yamlInfo]
end

def updateYML_dat(blockNmae,fieldName,newData)
  yamlinput = "./features/support/test_data/DataFile.yml"
	config = YAML.load_file(yamlinput)
	puts config[fieldName] #in my file this is set to "some data"
	config[blockNmae][fieldName] = newData
	File.open(yamlinput,'w') do |h|
		h.write config.to_yaml
	end
end

def writeFailure(data)
  puts "<span style='color:red'>#{data}</span>"
end


def getCaseDetails(yamlInfo)
	yamlinput = "./features/support/test_data/case.yml"
	myoptions = YAML.load_file(yamlinput)
	myoptions[yamlInfo]
end

def getaccountdetails(accountdetails)
  yamlinput = "./features/support/test_data/accounts.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[accountdetails]
   
end

def getquotedetails(picklistdetailsquotes)
     yamlinput = "./features/support/test_data/Quote.yml"
     myoptions = YAML.load_file(yamlinput)
     myoptions[picklistdetailsquotes]
 end

def getquotecurrency(currency_value)
     yamlinput = "./features/support/test_data/Quote.yml"
     myoptions = YAML.load_file(yamlinput)
     myoptions[currency_value]
 end


def getCreateNewOpportunity(createopportunitytestdata)
  yamlinput = "./features/support/test_data/opportunites.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[createopportunitytestdata]
end

def gettestdata(picklistvalues)
  yamlinput = "./features/support/test_data/opportunites.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[picklistvalues]
end


def select_option(value)
  #  option_xpath = "//*[@id='#{id}']/option[2]"
  #  option = find(:xpath, second_option_xpath).text
  select(value, :from => "opp11")
end


def getCreateNewTask(requiredtestdataformandatoryfields)
  yamlinput = "./features/support/test_data/newtask_openactivities.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[requiredtestdataformandatoryfields]
end

def getCaseDetails(yamlInfo)
	yamlinput = "./features/support/test_data/case.yml"
	myoptions = YAML.load_file(yamlinput)
	myoptions[yamlInfo]
end

def getAssetData(yamlInfo)
  yamlinput="./features/support/test_data/Asset.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions['Batchtype']
  myoptions['ClientBatchCode']
  myoptions['ClientBatchCodeDescription']
  myoptions['SSIResultReason']
	myoptions['SSISubResultReason']
  myoptions['ExistingRenewalCurrency']
  myoptions['ChangeType']
  myoptions['ClientBatchCodeDescription']
end

def getTaskDetails(task_details)
  yamlinput = "./features/support/test_data/Tasks.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[task_details]
end

def getGeneralDetails(yamlInfo)
	yamlinput = "./features/support/test_data/General.yml"
	myoptions = YAML.load_file(yamlinput)
	myoptions[yamlInfo]
end
