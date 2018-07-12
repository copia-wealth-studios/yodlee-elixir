defmodule Yodlee.Mixfile do
  use Mix.Project

  @description """
    An Elixir Library for Yodlee's v1.0 API
  """

  def project do
    [
      app: :yodlee,
      version: "0.1.1",
      description: @description,
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      package: package(),
      deps: deps(),
      dialyzer: [plt_add_deps: false],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.0"},
      {:bypass, "~> 0.8", only: [:test]},
      {:recase, "~> 0.2"},
      {:credo, "~> 0.5", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.6", only: [:test]},
      {:ex_doc, "~> 0.16", only: [:dev], runtime: false}
    ]
  end

  defp package do
    [
      name: :yodlee_elixir,
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      maintainers: ["Will Gilman"],
      links: %{"Github" => "https://github.com/wfgilman/yodlee-elixir"}
    ]
  end
end
