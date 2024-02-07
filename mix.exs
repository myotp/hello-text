defmodule HelloText.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello_text,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {HelloText.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bumblebee, "~> 0.4.2"},
      {:nx, "~> 0.6.4"},
      {:exla, "~> 0.6.4"}
    ]
  end
end
