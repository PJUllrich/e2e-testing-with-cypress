defmodule E2eWithCypressWeb.PageView do
  use E2eWithCypressWeb, :view

  def pad(num) do
    num
    |> :erlang.float_to_binary([decimals: 2])
    |> String.pad_leading(3, "0")
  end
end
