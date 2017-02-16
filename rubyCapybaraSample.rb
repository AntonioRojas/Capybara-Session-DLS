require 'capybara'
require 'selenium-webdriver'
Capybara.default_max_wait_time = 60
Capybara.default_driver = :selenium
Capybara.run_server = false

Capybara.register_driver :selenium do |app|
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
	#Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

session =  session = Capybara::Session.new(:selenium) 
session.visit "http://blog-antonio-rojas.blogspot.com"
session.windows.each do |pages|
  puts pages
end
session.windows[0].maximize
if session.has_content?("TechBlog de Antonio Rojas Ferrufino")
  if (session.has_xpath?("//*[@id=\"Blog1\"]/div[1]/div[1]/div/div[1]/div/h3/a"))
	puts "you rock, friend!"
  else
	puts ":( no tagline fonud, possibly something's broken"
  end
else
  puts ":( no tagline fonud, possibly something's broken"
  exit(-1)
end