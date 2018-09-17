defmodule Klaviyo.Template do
  @doc """
  Create a copy of a template.
  """
  @spec clone(String.t(), map) :: Klaviyo.Operation.t()
  def clone(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :post,
      params: params,
      path: "v1/email-template/#{id}/clone"
    }
  end

  @doc """
  Create a template.
  """
  @spec create(map) :: Klaviyo.Operation.t()
  def create(params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :post,
      params: params,
      path: "v1/email-templates"
    }
  end

  @doc """
  Delete a template.
  """
  @spec delete(String.t()) :: Klaviyo.Operation.t()
  def delete(id) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :delete,
      path: "v1/email-template/#{id}"
    }
  end

  @doc """
  Get a list of all templates.
  """
  @spec list() :: Klaviyo.Operation.t()
  def list() do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :get,
      path: "v1/email-templates"
    }
  end

  @doc """
  Renders a template.
  """
  @spec render(String.t(), map) :: Klaviyo.Operation.t()
  def render(id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :post,
      params: params,
      path: "v1/email-template/#{id}/render"
    }
  end

  @doc """
  Renders a template and sends it as an email.
  """
  @spec send(String.t(), map) :: Klaviyo.Operation.t()
  def send(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :post,
      params: params,
      path: "v1/email-template/#{id}/send"
    }
  end

  @doc """
  Update an email template.
  """
  @spec update(String.t(), map) :: Klaviyo.Operation.t()
  def update(id, params) do
    %Klaviyo.Operation{
      auth: :private,
      http_method: :put,
      params: params,
      path: "v1/email-template/#{id}"
    }
  end
end
