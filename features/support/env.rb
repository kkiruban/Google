require "rubygems"
require "rspec"
require 'Capybara'
require "capybara/cucumber"
require 'yaml'
require 'writeexcel'

Capybara.register_driver :chrome do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome,:switches => %w[ --disable-extensions ])
end

Capybara.default_driver = :chrome
Capybara.default_wait_time =30


ENV['TEST_ENV'] ||= 'staging'
project_root = File.expand_path('../..', __FILE__)
$BASE_URL = YAML.load_file(project_root + "/config/cucumber.yml")[ENV['TEST_ENV']][:url]


Before do
  page.driver.browser.manage.window.maximize
end

at_exit do
  page.quit
end

#After do |scenario|
#  if scenario.failed?
#    @Scenario_name = scenario.name
#    # Create a new Excel Workbook
#    workbook = WriteExcel.new('buildanalysis.xls')
#    # Add worksheet(s)
#    worksheet  = workbook.add_worksheet
##    # Add and define a format
##    format = workbook.add_format
##    format.set_bold
##    format.set_color('red')
##    format.set_align('right')
#
#    # write a formatted and unformatted string.
#    worksheet.write(2, 1, scenario.name)
#    # write to file
#    workbook.close
#  else
#
#  end
#end
