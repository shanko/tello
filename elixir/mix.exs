defmodule Tello.MixProject do
  use Mix.Project

  def project do
    [
      app: :tello,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Tello.Application, []}
    ]
  end

  defp aliases do
    [
      "clean.all": ["clean --all", "deps.clean --all"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:socket, "~> 0.3.13"}
    ]
  end
end
