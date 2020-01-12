require 'rails_helper'
require 'vcr_helper'

RSpec.describe Scraper do
  describe '#get_url' do
    context 'when the URL responds successfully' do
      let(:user) { User.create!(name: 'Fretadão', url: 'https://twitter.com/usefretadao') }

      it 'gets website title' do
        VCR.use_cassette :twitter do
          title = Scraper.new(user).parse_page.title

          expect(title).to eq('Fretadão (@usefretadao) | Twitter')
        end
      end

      it 'gets user username' do
        VCR.use_cassette :twitter do
          twitter_user = Scraper.call(user).value
          expect(twitter_user.username).to eq('Fretadão')
        end
      end

      it 'gets user description' do
        VCR.use_cassette :twitter do
          twitter_user = Scraper.call(user).value
          expect(twitter_user.description).to eq('Plataforma que possibilita pessoas a encontrar e contratar o transporte mais adequado para seu dia-a-dia. ')
        end
      end

      it 'gets user image' do
        VCR.use_cassette :twitter do
          twitter_user = Scraper.call(user).value
          expect(twitter_user.image_url).to eq('https://pbs.twimg.com/profile_images/1129008427181793281/VbIi_20y_400x400.png')
        end
      end
    end
  end
end