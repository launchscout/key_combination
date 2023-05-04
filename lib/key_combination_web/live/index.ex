defmodule KeyCombinationWeb.PageLive.Index do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    Hello World!
    """
  end
end
