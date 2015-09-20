class XboxLiveApi
  # @api private
  class HttpResponse
    attr_reader :body, :headers, :status_code

    def initialize(body, headers, status_code)
      @body = body
      @headers = headers
      @status_code = status_code
    end

    def ==(o)
      o.class == self.class && o.state == state
    end

    def hash
      state.hash
    end

    protected

    def state
      [@body, @headers, @status_code]
    end
  end
end