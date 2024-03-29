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
      test_paths: Path.wildcard("*/test"),
      aliases: aliases()
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
      {:covertool, "~> 2.0", only: [:test], runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:junit_formatter, "~> 3.3", only: [:test]},
      {:mix_audit, "~> 2.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    [
      setup: [
        "local.hex --force --if-missing",
        "local.rebar --force --if-missing",
        "deps.get",
        "deps.compile"
      ],
      audit: ["hex.audit", "deps.audit", "deps.unlock --check-unused"],
    ]
  end
end
