class BaseRequest

  def initialize(auth_header)
    @auth_header = auth_header
  end

  def header_for_version(version)
    {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'Authorization' => @auth_header,
        'x-xbl-contract-version' => version
    }
  end
end