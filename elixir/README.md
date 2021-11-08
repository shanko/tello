# Tello

An Elixir app to control TelloEDU drones.

## But First, a Caveat

This code is in a very rudimentary state. I've knocked it together in a couple of hours
with nothing but the `ruby` code and documentation for the
[Tello EDU SDK](https://dl-cdn.ryzerobotics.com/downloads/Tello/Tello%20SDK%202.0%20User%20Guide.pdf).
As such, I offer no guarantee that it's ready for anything resembling real world usage.

That being said….

## Usage

As I don't have access to actual hardware, the drone is simulated by a server running the code in
the `MockDrone` module.

The code controlling the "drone" currently runs in `ExUnit` tests, which create a `MockDrone` server
before each test.

```shell
mix deps.get
mix test
```

## Installation

1. Clone the repository
2. Change the current directory to `elixir`
3. (optional) Install the versions of Erlang and Elixir listed in `.tool-versions`

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `tello` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tello, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/tello](https://hexdocs.pm/tello).

## Dependencies

```text
erlang 23.3.1
elixir 1.12.3-otp-23
```

Project files were created with

```shell
mix new . --app tello --module Tello --sup
```
