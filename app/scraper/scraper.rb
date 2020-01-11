require 'nokogiri'
require 'httparty'

class Scraper
  attr_accessor :user

  def self.call(*params)
    new(*params).call
  end

  def initialize(user)
    @user = user
    @url = user.url
  end

  def call
    parse_page
    get_username
    get_user_description
    get_user_image
    self
  end

  def value
    user
  end

  def get_username
    @user.username = @parsed_page.css('a.ProfileHeaderCard-nameLink.u-textInheritColor').text
  end

  def get_user_description
    @user.description = @parsed_page.css('p.ProfileHeaderCard-bio.u-dir').text
  end

  def get_user_image
    @user.image_url = @parsed_page.css('img.ProfileAvatar-image').attribute("src").value
  end

  def parse_page
    unparsed_page = HTTParty.get(@url)
    @parsed_page = Nokogiri::HTML(unparsed_page)
  end
end