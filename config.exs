import Config

config :elixir,
  time_zone_database: Tzdata.TimeZoneDatabase

config :junit_formatter,
  print_report_file: true,
  include_filename?: true,
  include_file_line?: true
