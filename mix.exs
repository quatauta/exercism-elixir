defmodule ExercismElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :excercism_elixir,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      build_path: ".cache/_build",
      config_path: "config.exs",
      deps_path: ".cache/deps",
      elixirc_paths: Path.wildcard("*/lib"),
      test_coverage: [output: ".cache/cover", summary: true, tool: :covertool],
      test_paths: Path.wildcard("*/test")
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
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:covertool, "~> 2.0", only: [:test], runtime: false},
      {:junit_formatter, "~> 3.1", only: [:test]},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false}
    ]
  end
end
