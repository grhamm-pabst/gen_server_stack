defmodule GenServerStack.Client do
  alias GenServerStack.Server

  def start_link(initial_stack) when is_list(initial_stack) do
    GenServer.start_link(Server, initial_stack)
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  def read(pid) do
    GenServer.call(pid, :read)
  end
end
