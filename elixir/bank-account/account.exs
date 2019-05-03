defmodule BankAccount do
  use GenServer

  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    {:ok, account} = GenServer.start_link(__MODULE__, {:open, 0})
    account
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    GenServer.call(account, {:close})
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    GenServer.call(account, {:balance})
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    GenServer.call(account, {:update, amount})
  end

  def init(account), do: {:ok, account}

  def handle_call({:close}, _from, {_, balance}), do: {:reply, {:closed, balance}, {:closed, balance}}

  def handle_call({:balance}, _from, {:open,   balance}), do: {:reply, balance, {:open, balance}}
  def handle_call({:balance}, _from, {:closed, balance}), do: {:reply, {:error, :account_closed}, {:closed, balance}}

  def handle_call({:update, amount}, _from, {:open,   balance}), do: {:reply, balance + amount, {:open, balance + amount}}
  def handle_call({:update, _amount}, _from, {:closed, balance}), do: {:reply, {:error, :account_closed}, {:closed, balance}}
end
