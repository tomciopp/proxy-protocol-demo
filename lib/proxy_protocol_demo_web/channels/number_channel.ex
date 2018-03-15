defmodule ProxyProtocolDemoWeb.NumberChannel do
  @moduledoc false

  use Phoenix.Channel

  def join("number:lobby", _message, socket) do
    {:ok, socket}
  end

  def handle_in("msg", _params, socket) do
    {:reply, {:ok, %{ number: Enum.random(0..100)}}, socket}
  end
end