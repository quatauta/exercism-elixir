defmodule BankAccount do
  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  use GenServer

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank do
    {:ok, account} = GenServer.start_link(__MODULE__, {:open, 0})
    account
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: no_return()
  def close_bank(account) do
    GenServer.call(account, {:close})
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer()
  def balance(account) do
    GenServer.call(account, {:balance})
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any()
  def update(account, amount) do
    GenServer.call(account, {:update, amount})
  end

  @impl GenServer
  def init(account), do: {:ok, account}

  @impl GenServer
  def handle_call({:close}, _, {_, balance}),
    do: {:reply, {:closed, balance}, {:closed, balance}}

  @impl GenServer
  def handle_call({:balance}, _, {:open, balance}), do: {:reply, balance, {:open, balance}}

  @impl GenServer
  def handle_call({:balance}, _, {:closed, balance}),
    do: {:reply, {:error, :account_closed}, {:closed, balance}}

  @impl GenServer
  def handle_call({:update, amount}, _, {:open, balance}),
    do: {:reply, balance + amount, {:open, balance + amount}}

  @impl GenServer
  def handle_call({:update, _amount}, _, {:closed, balance}),
    do: {:reply, {:error, :account_closed}, {:closed, balance}}
end
