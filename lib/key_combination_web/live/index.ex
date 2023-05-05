defmodule KeyCombinationWeb.PageLive.Index do
  use Phoenix.LiveView
  import KeyCombinationWeb.CoreComponents
  alias Phoenix.LiveView.JS

  def mount(_params, _session, socket) do
    {:ok, assign(socket, show_cheatsheet: false)}
  end

  def handle_event("open_cheatsheat", %{"ctrlKey" => ctrl_key, "key" => key}, socket) do
    socket =
      if String.downcase(key) == "k" && ctrl_key == true do
        assign(socket, show_cheatsheet: true)
      else
        socket
      end

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div phx-window-keydown="open_cheatsheat">
      <h1 class="text-center mt-16">
        Hello World!
      </h1>
      <p class="text-center mt-8">
        Press "Control + k" to view keyboard shortcuts.
      </p>
      <.modal id="cheatsheet" :if={@show_cheatsheet} show on_cancel={JS.navigate("/")}>
        <ul>
          <li>Shortcut 1</li>
          <li>Shortcut 2</li>
          <li>Shortcut 3</li>
          <li>Shortcut 4</li>
        </ul>
      </.modal>
    </div>
    """
  end
end
