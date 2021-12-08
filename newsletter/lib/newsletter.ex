defmodule Newsletter do
  @moduledoc false

  @spec read_emails(Path.t()) :: [String.t()]
  def read_emails(path) do
    try do
      path |> File.stream!() |> Stream.map(&String.trim/1) |> Enum.to_list()
    rescue
      _ -> []
    end
  end

  @spec open_log(path :: String.t()) :: pid
  def open_log(path) do
    File.open!(path, [:write])
  end

  @spec log_sent_email(pid, String.t()) :: :ok
  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  @spec close_log(pid) :: :ok | {:error, atom}
  def close_log(pid) do
    File.close(pid)
  end

  @spec send_newsletter(String.t(), String.t(), (email :: String.t() -> :ok | :error)) ::
          :ok | {:error, atom}
  def send_newsletter(emails_path, log_path, send_fun) do
    log = open_log(log_path)

    emails_path
    |> read_emails()
    |> Enum.each(fn email ->
      with :ok <- send_fun.(email) do
        log_sent_email(log, email)
      end
    end)

    close_log(log)
  end
end
