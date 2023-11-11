defmodule Admin.Kaffy.Extension do
  def stylesheets(_conn) do
    [
      {:safe, ~s(<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" />)}
    ]
  end

  def javascripts(_conn) do
    [
      {:safe, ~s(<script src="https://example.com/javascript.js"></script>)}
    ]
  end
end
