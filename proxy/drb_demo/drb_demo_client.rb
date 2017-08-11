require 'drb/drb'

# This is an example of a remote proxy.
# Instead of connecting to the object directly, we use the remote proxy
# to connect to the object.

# Start the server and then run the client.

DRb.start_service
math_service = DRbObject.new_with_uri("druby://localhost:3030")

puts math_service.add(2, 2)
