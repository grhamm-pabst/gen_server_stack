defmodule GenServerStack.Server do
  use GenServer

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  # SYNC
  @impl true
  def handle_call({:push, element}, _from, stack) do
    new_stack = [element | stack]
    {:reply, new_stack, new_stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | new_stack]) do
    {:reply, head, new_stack}
  end

  @impl true
  def handle_call(:pop, _from, _stack) do
    {:reply, nil, []}
  end

  @impl true
  def handle_call(:read, _from, stack) do
    {:reply, stack, stack}
  end

  # ASYNC
  @impl true
  def handle_cast({:push, element}, stack) do
    new_stack = [element | stack]
    {:noreply, new_stack}
  end

  @impl true
  def handle_cast(:pop, [_head | new_stack]) do
    {:noreply, new_stack}
  end
end
