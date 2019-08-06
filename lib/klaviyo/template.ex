defmodule Klaviyo.Template do
  @doc """
  Return all email templates.

  Email templates are returned in sorted order by name.
  """
  @spec all :: Klaviyo.Operation.t()
  def all do
    %Klaviyo.Operation{
      auth: :private,
      method: :get,
      path: "v1/email-templates"
    }
  end

  @doc """
  Create a copy of an email template.
  """
  @spec clone(String.t(), map) :: Klaviyo.Operation.t()
  def clone(template_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: params,
      path: "v1/email-template/#{template_id}/clone"
    }
  end

  @doc """
  Create an email template.
  """
  @spec create(map) :: Klaviyo.Operation.t()
  def create(params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: params,
      path: "v1/email-templates"
    }
  end

  @doc """
  Delete an email template.
  """
  @spec delete(String.t()) :: Klaviyo.Operation.t()
  def delete(template_id) do
    %Klaviyo.Operation{
      auth: :private,
      method: :delete,
      path: "v1/email-template/#{template_id}"
    }
  end

  @doc """
  Renders HTML and text versions of an email template.
  """
  @spec render(String.t(), map) :: Klaviyo.Operation.t()
  def render(template_id, params \\ %{}) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: params,
      path: "v1/email-template/#{template_id}/render"
    }
  end

  @doc """
  Renders and sends an email template.
  """
  @spec send(String.t(), map) :: Klaviyo.Operation.t()
  def send(template_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :post,
      params: params,
      path: "v1/email-template/#{template_id}/send"
    }
  end

  @doc """
  Update an email template.

  Only updates imported HTML templates.
  """
  @spec update(String.t(), map) :: Klaviyo.Operation.t()
  def update(template_id, params) do
    %Klaviyo.Operation{
      auth: :private,
      method: :put,
      params: params,
      path: "v1/email-template/#{template_id}"
    }
  end
end
