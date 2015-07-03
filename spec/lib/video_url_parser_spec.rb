require 'spec_helper'

describe VideoURLParser do
  it 'has a version number' do
    expect(VideoURLParser::VERSION).not_to be nil
  end

  describe('.parse') do
    subject { VideoURLParser.parse(url) }
    context('when passed something other than a video URL') do
      let(:url) { 'https://www.example.com' }

      it 'returns nil' do
        expect(subject).to eq(nil)
      end
    end

    context('when passed a long URL') do
      let(:url) { 'https://www.youtube.com/watch?v=5Qg6G7I4RS4#t=2m32s' }

      it 'returns the id' do
        expect(subject).to eq({
          id: '5Qg6G7I4RS4'
        })
      end
    end
  end
end
