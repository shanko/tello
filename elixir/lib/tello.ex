defmodule Tello do
  @moduledoc """
  Documentation for `Tello`.
  """

  @default_server_address {127, 0, 0, 1}
  @default_server_port 8889

  @doc """
  Sends `data` to the `to` value, where `to` is a tuple of
  { host, port } like {{127, 0, 0, 1}, 1337}
  """
  def send_data(data, to \\ {@default_server_address, @default_server_port}) do
    # Without specifying the port, we randomize it
    server = Socket.UDP.open!()
    Socket.Datagram.send!(server, data, to)
    {data, _sender} = server |> Socket.Datagram.recv!()
    # IO.puts("Response: #{data}, from #{inspect(sender)}")
    data
  end
end
