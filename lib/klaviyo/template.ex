defmodule Klaviyo.Template do
  alias Klaviyo.RequestOperation

  @spec all(Enum.t()) :: RequestOperation.t()
  def all(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/templates",
      query: params
    }
  end

  @spec clone(Enum.t()) :: RequestOperation.t()
  def clone(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/template-clone"
    }
  end

  @spec create(Enum.t()) :: RequestOperation.t()
  def create(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/templates"
    }
  end

  @spec delete(String.t()) :: RequestOperation.t()
  def delete(template_id) do
    %RequestOperation{
      method: :delete,
      path: "/api/templates/#{template_id}"
    }
  end

  @spec get(String.t(), Enum.t()) :: RequestOperation.t()
  def get(template_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/templates/#{template_id}",
      query: params
    }
  end

  @spec render(Enum.t()) :: RequestOperation.t()
  def render(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/template-render"
    }
  end

  @spec update(String.t(), Enum.t()) :: RequestOperation.t()
  def update(template_id, params) do
    %RequestOperation{
      body: params,
      method: :put,
      path: "/api/templates/#{template_id}"
    }
  end
end
