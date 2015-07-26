require 'httpclient'
require 'http_response'
require 'oj'

class HttpSessionGateway

  def initialize
    @client = HTTPClient.new
  end

  def get(uri, query: nil, body: nil, header: nil, follow_redirect: nil)
    resp = @client.get(uri, query: query, body: body, header: header, follow_redirect: follow_redirect)
    transform_response(resp)
  end

  def post(uri, query: nil, body: nil, header: nil, follow_redirect: nil)
    resp = @client.post(uri, query: query, body: body, header: header, follow_redirect: follow_redirect)
    transform_response(resp)
  end

  def post_json(uri, query: nil, body: nil, header: nil, follow_redirect: nil)
    body = Oj.dump(body) unless body.nil?
    post(uri, query: query, body: body, header: header, follow_redirect: follow_redirect)
  end

  private

  def transform_response(resp)
    HttpResponse.new(resp.body, resp.headers, 200)
  end

  def transform_response_json(resp)
    HttpResponse.new(Oj.load(resp.body), resp.headers, 200)
  end
end