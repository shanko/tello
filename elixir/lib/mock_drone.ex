defmodule MockDrone do
  @moduledoc """
  A mock implementation of the drone side of the Tello SDK documented at
  https://dl-cdn.ryzerobotics.com/downloads/Tello/Tello%20SDK%202.0%20User%20Guide.pdf.

  It is very bare-bones for now. I may flesh it out over time for the fun of it.
  """

  @default_server_port 8889

  def launch_server do
    launch_server(@default_server_port)
  end

  def launch_server(port) do
    IO.puts("MockDrone listening on port #{port}")
    server = Socket.UDP.open!(port)
    serve(server)
  end

  def serve(server) do
    {data, client} = server |> Socket.Datagram.recv!()
    # IO.puts("Received: #{data}, from #{inspect(client)}")

    response =
      case data do
        # control commands
        "command" -> "ok"
        "takeoff" -> "ok"
        "land" -> "ok"
        # set commands

        # read commands
        "battery?" -> "100"
        "time?" -> "0"
        # unknown commands
        _ -> "error"
      end

    Socket.Datagram.send!(server, response, client)
    serve(server)
  end
end
