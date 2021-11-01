
# Ruby script to connect to a Tello drone: basic takeoff and land

require "socket"

class Tello
  ## Constants defined by Tello
  HOST = "192.168.10.1"
  PORT = 8889
  BUFF_LEN = 1518

  def initialize
    # Create UDP socket which will recieve the response on any other port
    @udps = UDPSocket.new
    @udps.connect(HOST, PORT)
  end

  # Send the message to Tello and allow for a delay in seconds
  def send(message, delay)

    bytes = 0

    # Try to send the message otherwise print the exception
    begin
      bytes = @udps.send(message)
      puts("Sent message: '#{message}' of #{bytes} bytes")
    rescue ex : Socket::ConnectError
      puts("Error sending message '#{message}': " + ex.to_s)
    end

    # Delay for a user-defined period
    sleep(delay)

    bytes
  end

  # Receive the message from Tello
  def receive
    # Continuously loop and listen for incoming messages
    while true
      begin
        resp, sender = @udps.receive
        puts("Received message: '#{resp.to_s.chomp}' from #{sender}")
      rescue ex : Socket::ConnectError
        # If there"s an error close the socket and break out of the loop
        @udps.close
        puts("Error receiving message: " + ex.to_s)
        break
      end
    end
  end
end

tello = Tello.new

# Create and start a listening thread that runs in the background
# This utilizes our receive functions and will continuously monitor
# for incoming messages
th = Thread.new { tello.receive }

# Put Tello into command mode
tello.send("command", 2)

# Check battery status
tello.send("battery?", 2)

# Check battery status
tello.send("time?", 2)

# Takeoff
tello.send("takeoff", 8)

# Land
tello.send("land", 4)

puts "Mission Accomplished"
