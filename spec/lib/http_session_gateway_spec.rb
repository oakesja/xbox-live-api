require 'http_session_gateway'
require 'http_response'
require 'httpclient'
require 'oj'

describe HttpSessionGateway do
  let(:subject) { HttpSessionGateway.new }
  let(:client) { double }
  let(:uri) { 'http://www.example.com' }
  let(:query) { {param: 'value'} }
  let(:body) { {key: 'value'}  }
  let(:header) { {header: 'value'} }
  let(:follow_redirect) { 'http://www.example.com' }
  let(:status) { 200 }
  let(:response_header) do
    response_header = HTTP::Message::Headers.new
    response_header.add(header.keys.first, header[header.keys.first])
    response_header
  end
  let(:response_body) { Oj.dump(body) }
  let(:message) do
    message = HTTP::Message.new_response(response_body)
    message.status = status
    message.http_header = response_header
    message
  end

  before(:each) do
    allow(HTTPClient).to receive(:new) { client }
  end

  describe '#get' do
    before(:each) do
      allow(client).to receive(:get) { message }
    end

    context 'when given extra parameters' do
      it 'calls the client\'s get with the extra parameters' do
        expect_client_to_receive_all_params(:get)
        subject.get(uri, query: query, body: body, header: header, follow_redirect: follow_redirect)
      end
    end

    context 'when given no extra parameters' do
      it 'calls the client\'s get with nil for the extra parameters' do
        expect_client_to_recieve_no_params(:get)
        subject.get(uri)
      end
    end

    it 'returns a HttpResponse with string body' do
      expect(subject.get(uri)).to eq HttpResponse.new(response_body, header, status)
    end
  end

  describe '#get_json' do
    before(:each) do
      allow(client).to receive(:get) { message }
    end

    context 'when given extra parameters' do
      it 'calls the client\'s get with the extra parameters' do
        expect_client_to_receive_all_params(:get)
        subject.get_json(uri, query: query, body: body, header: header, follow_redirect: follow_redirect)
      end
    end

    context 'when given no extra parameters' do
      it 'calls the client\'s get with nil for the extra parameters' do
        expect_client_to_recieve_no_params(:get)
        subject.get_json(uri)
      end
    end

    it 'returns a HttpResponse with the json body converted to a hash' do
      expect(subject.get_json(uri)).to eq HttpResponse.new(Oj.load(response_body), header, status)
    end
  end

  describe '#post' do
    before(:each) do
      allow(client).to receive(:post) { message }
    end

    context 'when given extra parameters' do
      it 'calls the client\'s get with the extra parameters' do
        expect_client_to_receive_all_params(:post)
        subject.post(uri, query: query, body: body, header: header, follow_redirect: follow_redirect)
      end
    end

    context 'when given no extra parameters' do
      it 'calls the client\'s get with nil for the extra parameters' do
        expect_client_to_recieve_no_params(:post)
        subject.post(uri)
      end
    end

    it 'returns a HttpResponse with string body' do
      expect(subject.post(uri)).to eq HttpResponse.new(response_body, header, status)
    end
  end

  describe '#post_json' do
    before(:each) do
      allow(client).to receive(:post) { message }
    end

    context 'when given a body to post' do
      it 'converts the body hash into json to post' do
        expect(client).to receive(:post).with(uri, query: query, body: Oj.dump(body), header: header, follow_redirect: follow_redirect)
        subject.post_json(uri, query: query, body: body, header: header, follow_redirect: follow_redirect)
      end
    end

    context 'when given no extra parameters' do
      it 'calls the client\'s get with nil for the extra parameters' do
        expect_client_to_recieve_no_params(:post)
        subject.post_json(uri)
      end
    end

    it 'returns a HttpResponse with string body' do
      expect(subject.post_json(uri)).to eq HttpResponse.new(response_body, header, status)
    end
  end

  def expect_client_to_receive_all_params(method)
    expect(client).to receive(method).with(uri, query: query, body: body, header: header, follow_redirect: follow_redirect)
  end

  def expect_client_to_recieve_no_params(method)
    expect(client).to receive(method).with(uri, query: nil, body: nil, header: nil, follow_redirect: nil)
  end
end
