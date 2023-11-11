defmodule Admin.Blog.PostAdmin do
  def index(_) do
    [
      id: nil,
      title: nil
    ]
  end

  def custom_links(_schema) do
    [
      %{
        name: "Source Code",
        url: "https://example.com/repo/issues",
        order: 2,
        location: :top,
        full_icon: "paperclip"
      },
      %{
        name: "Products On Site",
        url: "https://example.com/products",
        location: :sub,
        target: "_blank"
      },
      %{
        name: "Support us",
        url: "https://example.com/products",
        location: :bottom,
        target: "_blank",
        full_icon: "usd"
      }
    ]
  end

  def custom_pages(_schema, _conn) do
    [
      %{
        slug: "my-own-thing",
        name: "Secret Place",
        view: AdminWeb.PostView,
        template: "custom_post.html",
        assigns: [custom_message: "one two three"],
        order: 2
      }
    ]
  end
end
