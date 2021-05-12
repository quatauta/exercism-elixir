ExUnit.configure(formatters: [JUnitFormatter, ExUnit.CLIFormatter])
ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)
