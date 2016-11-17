defmodule SampleDashboard.Mixfile do
  use Mix.Project

  def project do
    [app: :sample_dashboard,
     version: "0.0.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [applications: [:logger, :kitto, :httpoison, :poison]]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:kitto, "~> 0.2.3"},
     {:httpoison, "~> 0.9.0"},
     {:poison, "~> 2.0"}]
  end
end
