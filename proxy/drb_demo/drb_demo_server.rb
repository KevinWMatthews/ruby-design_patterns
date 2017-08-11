require 'drb/drb'

# This is an example of a remote proxy.
# Instead of connecting to the object directly, we use the remote proxy
# to connect to the object.

class MathService
  def add(a, b)
    a + b
  end
end

math_service = MathService.new
DRb.start_service("druby://localhost:3030", math_service)
DRb.thread.join
