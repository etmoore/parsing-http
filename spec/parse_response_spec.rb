require_relative './spec_helper'
require_relative '../lib/parse_response'

RSpec.describe Request do
  before do
    req = File.read('../data/test_request.txt')
    @request = Request.new(req)
  end

  describe 'path' do
    it 'returns the request path string' do
      expect(@request.path).to eq("/news/031415")
    end
  end

  describe 'verb' do
    it 'returns the HTTP request type' do
      expect(@request.verb).to  eq("POST")
    end
  end

  describe 'headers' do
    it 'returns a hash of the headers' do
      # expect(@require.header).to match(
      #  "Host" => "localhost:3000"
      #  "Cache-Control" => "no-cache"
      #  "Content-Type" => "application/x-www-form-url-urlencoded"
      #  )
    end
  end

end
