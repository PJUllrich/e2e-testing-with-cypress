defmodule E2eWithCypressWeb.IndexLive do
  use Phoenix.LiveView

  def render(assigns) do
    Phoenix.View.render(E2eWithCypressWeb.PageView, "index.html", assigns)
  end

  def mount(_session, socket) do
    socket =
      socket
      |> assign(:name, nil)
      |> assign(:items, get_items())

    {:ok, socket}
  end

  def handle_event("submit", %{"name" => name}, socket) do
    {:noreply, assign(socket, :name, name)}
  end

  def handle_event("dec", %{"value" => item_id}, socket) do
    id = String.to_integer(item_id)

    updated_items =
      socket.assigns.items
      |> Enum.map(
        &if &1.id == id, do: Map.merge(&1, %{quantity: max(&1.quantity - 1, 0)}), else: &1
      )

    {:noreply, assign(socket, :items, updated_items)}
  end

  def handle_event("inc", %{"value" => item_id}, socket) do
    id = String.to_integer(item_id)

    updated_items =
      socket.assigns.items
      |> Enum.map(&if &1.id == id, do: Map.merge(&1, %{quantity: &1.quantity + 1}), else: &1)

    {:noreply, assign(socket, :items, updated_items)}
  end

  defp get_items do
    [
      %{id: 2, name: "Apples", price: 0.13, quantity: 5},
      %{id: 0, name: "Bread", price: 1.50, quantity: 1},
      %{id: 1, name: "Butter", price: 2.25, quantity: 2},
      %{id: 3, name: "Oranges", price: 0.23, quantity: 4}
    ]
  end
end
