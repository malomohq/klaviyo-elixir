defmodule Klaviyo.Flow do
  alias Klaviyo.RequestOperation

  @spec all(Enum.t()) :: RequestOperation.t()
  def all(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/flows",
      query: params
    }
  end

  @spec all_actions(String.t(), Enum.t()) :: RequestOperation.t()
  def all_actions(flow_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/flows/#{flow_id}/flow-actions",
      query: params
    }
  end

  @spec all_messages_for_flow_action(String.t(), Enum.t()) :: RequestOperation.t()
  def all_messages_for_flow_action(flow_action_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/flow-actions/#{flow_action_id}/flow-messages",
      query: params
    }
  end

  @spec all_relationships(String.t(), String.t()) :: RequestOperation.t()
  def all_relationships(flow_id, related_resource) do
    %RequestOperation{
      method: :get,
      path: "/api/flows/#{flow_id}/relationships/#{related_resource}"
    }
  end

  @spec all_relationships_for_action(String.t(), String.t(), Enum.t()) ::
          RequestOperation.t()
  def all_relationships_for_action(flow_action_id, related_resource, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/flow-actions/#{flow_action_id}/relationships/#{related_resource}",
      query: params
    }
  end

  @spec all_relationships_for_message(String.t(), String.t(), Enum.t()) ::
          RequestOperation.t()
  def all_relationships_for_message(flow_message_id, related_resource, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/flow-messages/#{flow_message_id}/relationships/#{related_resource}",
      query: params
    }
  end

  @spec all_tags(String.t(), Enum.t()) :: RequestOperation.t()
  def all_tags(flow_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/flows/#{flow_id}/tags",
      query: params
    }
  end

  @spec get(String.t(), Enum.t()) :: RequestOperation.t()
  def get(flow_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/flows/#{flow_id}",
      query: params
    }
  end

  @spec get_actions(String.t(), Enum.t()) :: RequestOperation.t()
  def get_actions(flow_action_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/flow-actions/#{flow_action_id}",
      query: params
    }
  end

  @spec get_action_for_message(String.t(), Enum.t()) :: RequestOperation.t()
  def get_action_for_message(flow_message_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/flow-messages/#{flow_message_id}/flow-action",
      query: params
    }
  end

  @spec get_for_flow_action(String.t(), Enum.t()) :: RequestOperation.t()
  def get_for_flow_action(flow_action_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/flow-actions/#{flow_action_id}/flow",
      query: params
    }
  end

  @spec get_message(String.t(), Enum.t()) :: RequestOperation.t()
  def get_message(flow_message_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/flow-messages/#{flow_message_id}",
      query: params
    }
  end

  @spec update_status(String.t(), Enum.t()) :: RequestOperation.t()
  def update_status(flow_id, params) do
    %RequestOperation{
      body: params,
      method: :patch,
      path: "/api/flows/#{flow_id}"
    }
  end
end
