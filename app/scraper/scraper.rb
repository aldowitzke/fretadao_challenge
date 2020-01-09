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
    # @url = user.url
    # @username = user.username
    # @description = user.description
  end

  def call
    parse_page
    get_username
    get_user_description
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

  def parse_page
    unparsed_page = HTTParty.get(@url)
    @parsed_page = Nokogiri::HTML(unparsed_page)
  end
end