class User < ApplicationRecord
  validates_presence_of :name, :url

  before_save :shorten_url

  private

  def shorten_url
    self.url = ShortURL.shorten(self.url)
  end
end
