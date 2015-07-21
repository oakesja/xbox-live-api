require 'http_session_gateway'
require 'request_info'

class Login

  def initialize(username, password)
    @username = username
    @password = password
    @http_gateway = HttpSessionGateway.new
  end

  def go
    url = get_request_url
    access_token = get_access_token(url)
    authenticate(access_token)
    authorize
    RequestInfo.new(user_id: @xid, gamertag: @gtg, authorization_header: @auth_header)
  end

  def get_request_url
    params = {
        client_id: '0000000048093EE3',
        redirect_uri: 'https://login.live.com/oauth20_desktop.srf',
        response_type: 'token',
        display: 'touch',
        scope: 'service::user.auth.xboxlive.com::MBI_SSL',
        locale: 'en',
    }

    resp = @http_gateway.get(url_with_params('https://login.live.com/oauth20_authorize.srf', params)).body
    @ppft = resp.match(/sFTTag:.*value="(.*)"\/>/)[1]
    resp.match(/urlPost:'([A-Za-z0-9:\?_\-\.&\/=]+)'/)[1]
  end

  def get_access_token(url)
    params = {
        login: @username,
        passwd: @password,
        PPFT: @ppft,
        PPSX: 'Passpor',
        SI: 'Sign in',
        type: '11',
        NewUser: '1',
        LoginOptions: '1',
        i3: '36728',
        m1: '768',
        m2: '1184',
        m3: '0',
        i12: '1',
        i17: '0',
        i18: '__Login_Host|1',
    }
    resp = @http_gateway.post(url, body: params, follow_redirect: false)
    location_header =  resp.headers['Location']
    CGI::parse(URI::parse(location_header).fragment)['access_token'].first
  end

  def authenticate(access_token)
    url = 'https://user.auth.xboxlive.com/user/authenticate'
    params = {
        'RelyingParty' => 'http://auth.xboxlive.com',
        'TokenType' => 'JWT',
        'Properties' => {
            'AuthMethod' => 'RPS',
            'SiteName' => 'user.auth.xboxlive.com',
            'RpsTicket' => access_token,
        }
    }

    resp = @http_gateway.post(url, body: Oj.dump(params), header: {'Content-Type' => 'application/json'})
    json =  Oj.load(resp.body)
    @token =  json['Token']
    @uhs =  json['DisplayClaims']['xui'][0]['uhs']
  end

  def authorize
    url = 'https://xsts.auth.xboxlive.com/xsts/authorize'
    params = {
        'RelyingParty' => 'http://xboxlive.com',
        'TokenType' => 'JWT',
        'Properties' => {
            'UserTokens' => [@token],
            'SandboxId' => 'RETAIL',
        }
    }
    resp = @http_gateway.post(url, body: Oj.dump(params), header: {'Content-Type' => 'application/json'})
    json =  Oj.load(resp.body)
    token =  json['Token']
    @xid =  json['DisplayClaims']['xui'][0]['xid']
    @gtg =  json['DisplayClaims']['xui'][0]['gtg']
    @auth_header = "XBL3.0 x=#{@uhs};#{token}"
  end

  def url_with_params(url, params)
    URI.escape("#{url}?#{prepare_url_parameters(params)}")
  end

  def prepare_url_parameters(params)
    URI.escape(params.collect { |k, v| "#{k}=#{v}" }.join('&'))
  end
end