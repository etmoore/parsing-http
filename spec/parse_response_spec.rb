require_relative './spec_helper'
require_relative '../lib/parse_response'

RSpec.describe Request do
  before do
    req = File.read('data/test_request.txt')
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
      expect(@request.headers).to eq({
       "Host" => "yahoo.com",
       "Cache-Control" => "no-cache",
       "Content-Type" => "application/x-www-form-url-urlencoded"
      })
    end
  end

  describe 'body' do
    it 'returns a string containing the request body' do
      req_body = 'first_name=Alex&last_name=Andrews&email=some@email.com&password=secure'
      expect(@request.body).to eq(req_body)
    end
  end

  describe 'querystring' do
    it 'returns the request query string' do
      req_q_string = 'query=42&sort=desc&find=name'
      expect(@request.querystring).to eq(req_q_string)
    end
  end

  describe 'params' do
    it 'returns a hash containing the request params' do
      req_params = {
        'query' => '42',
        'sort' => 'desc',
        'find' => 'name',
        'first_name' => 'Alex',
        'last_name' => 'Andrews',
        'email' => 'some@email.com',
        'password' => 'secure'
      }
      expect(@request.params).to eq(req_params)
    end
  end

  describe 'version' do
    it 'returns HTTP version string' do
      expect(@request.version).to eq('HTTP/1.1')
    end
  end

end
