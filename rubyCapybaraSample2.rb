require 'capybara'
require 'capybara/dsl'

Capybara.app_host = "http://google.com"
Capybara.default_max_wait_time = 60
Capybara.default_driver = :selenium

class CapybaraDriverRegistrar
  # register a Selenium driver for the given browser to run on the localhost
  def self.register_selenium_driver(browser)
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => browser)
    end
  end

end

class Prowler
  include Capybara::DSL

  def initialize
    visit "/"
    puts "Init"
  end

  def visitSite
    if (page.has_content?("como abortar un test suite en testng java"))
		puts "you rock"
	else
		puts "fails!"
	end
		
  end
end

CapybaraDriverRegistrar.register_selenium_driver(:firefox)
Capybara.run_server = false

prowler = Prowler.new
prowler.visitSite