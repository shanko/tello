defmodule TelloTest do
  use ExUnit.Case
  doctest Tello

  setup do
    spawn(MockDrone, :launch_server, [])

    :ok
  end

  test "if the MockDrone is listening" do
    assert Tello.send_data("command") == "ok"
  end

  test "if a sequence of commands is accepted" do
    assert Tello.send_data("command") == "ok"
    assert Tello.send_data("battery?") == "100"
    assert Tello.send_data("time?") == "0"
    assert Tello.send_data("takeoff") == "ok"
    assert Tello.send_data("land") == "ok"
  end
end
