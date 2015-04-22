class HomeController < ApplicationController
  
  def client(token=nil)
    Cronofy::Client.new('j4rJiM1QAj-gJjUYWFpX9VuSqAd2UHEh', 'VuR4bkEPCZVrRvgPG6Uft0iyQTh6oAM9fp0jCh2Ru1G10PZ_-r8Ld6pQw3SGMDjfOMNGYNmVS2GFNq595rpWkQ', token, '')
  end
  
  def callback
    token = client.get_token_from_code(code, "http://sauvignone.codepicnic.com:#{ENV['BASKET_APP_PORT']}/oauth2/callback")
    @cronofy = Cronofy::Client.new('j4rJiM1QAj-gJjUYWFpX9VuSqAd2UHEh', 'VuR4bkEPCZVrRvgPG6Uft0iyQTh6oAM9fp0jCh2Ru1G10PZ_-r8Ld6pQw3SGMDjfOMNGYNmVS2GFNq595rpWkQ', token, '')
    @calendars = @cronofy.list_calendars["calendars"]
  end
  
  def index
    @cronofy = client
  end
  
end