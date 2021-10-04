defmodule ExercismElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :excercism_elixir,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      build_path: "../.cache/elixir/_build",
      deps_path: "../.cache/elixir/deps",
      config_path: "config.exs",
      elixirc_paths: Path.wildcard("*/lib"),
      test_paths: Path.wildcard("*/test"),
      test_coverage: [output: "../.cache/elixir/cover"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:junit_formatter, "~> 3.1", only: [:test]},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end
end
