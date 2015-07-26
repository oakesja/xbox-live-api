class XboxLiveApi
  class MyComparable
    def ==(o)
      o.class == self.class && o.state == state
    end

    def hash
      state.hash
    end

    def state
      NotImplementedError
    end
  end
end