# @api private
module Kernel
  # @note This is overridden to suppress output from httpclient gem
  def warn(msg, *smth)
    #   TODO log the warning
  end
end
