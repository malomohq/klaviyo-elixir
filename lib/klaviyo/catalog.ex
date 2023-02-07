defmodule Klaviyo.Catalog do
  alias Klaviyo.RequestOperation

  @spec all_categories(Enum.t()) :: RequestOperation.t()
  def all_categories(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-categories",
      query: params
    }
  end

  @spec all_category_items(String.t(), Enum.t()) :: RequestOperation.t()
  def all_category_items(catalog_category_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-categories/#{catalog_category_id}/items",
      query: params
    }
  end

  @spec all_create_categories_jobs(Enum.t()) :: RequestOperation.t()
  def all_create_categories_jobs(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-category-bulk-create-jobs",
      query: params
    }
  end

  @spec all_create_items_jobs(Enum.t()) :: RequestOperation.t()
  def all_create_items_jobs(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-item-bulk-create-jobs",
      query: params
    }
  end

  @spec all_create_variants_jobs(Enum.t()) :: RequestOperation.t()
  def all_create_variants_jobs(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-variant-bulk-create-jobs",
      query: params
    }
  end

  @spec all_delete_categories_jobs(Enum.t()) :: RequestOperation.t()
  def all_delete_categories_jobs(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-category-bulk-delete-jobs",
      query: params
    }
  end

  @spec all_delete_items_jobs(Enum.t()) :: RequestOperation.t()
  def all_delete_items_jobs(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-item-bulk-delete-jobs",
      query: params
    }
  end

  @spec all_delete_variants_jobs(Enum.t()) :: RequestOperation.t()
  def all_delete_variants_jobs(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-variant-bulk-delete-jobs",
      query: params
    }
  end

  @spec all_items(Enum.t()) :: RequestOperation.t()
  def all_items(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-items",
      query: params
    }
  end

  @spec all_item_categories(String.t(), Enum.t()) :: RequestOperation.t()
  def all_item_categories(catalog_item_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-items/#{catalog_item_id}/categories",
      query: params
    }
  end

  @spec all_item_variants(String.t(), Enum.t()) :: RequestOperation.t()
  def all_item_variants(catalog_item_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-items/#{catalog_item_id}/variants",
      query: params
    }
  end

  @spec all_update_categories_jobs(Enum.t()) :: RequestOperation.t()
  def all_update_categories_jobs(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-category-bulk-update-jobs",
      query: params
    }
  end

  @spec all_update_items_jobs(Enum.t()) :: RequestOperation.t()
  def all_update_items_jobs(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-item-bulk-update-jobs",
      query: params
    }
  end

  @spec all_update_variants_jobs(Enum.t()) :: RequestOperation.t()
  def all_update_variants_jobs(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-variant-bulk-update-jobs",
      query: params
    }
  end

  @spec all_variants(Enum.t()) :: RequestOperation.t()
  def all_variants(params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-variants",
      query: params
    }
  end

  @spec create_category(Enum.t()) :: RequestOperation.t()
  def create_category(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-categories"
    }
  end

  @spec create_category_relationships(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def create_category_relationships(catalog_category_id, related_resource, params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-categories/#{catalog_category_id}/relationships/#{related_resource}/"
    }
  end

  @spec create_item(Enum.t()) :: RequestOperation.t()
  def create_item(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-items"
    }
  end

  def create_item_relationships(catalog_item_id, related_resource, params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-items/#{catalog_item_id}/relationships/#{related_resource}/"
    }
  end

  @spec create_variant(Enum.t()) :: RequestOperation.t()
  def create_variant(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-variants"
    }
  end

  @spec delete_category(String.t()) :: RequestOperation.t()
  def delete_category(catalog_category_id) do
    %RequestOperation{
      method: :delete,
      path: "/api/catalog-categories/#{catalog_category_id}"
    }
  end

  @spec delete_category_relationships(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def delete_category_relationships(catalog_category_id, related_resource, params) do
    %RequestOperation{
      body: params,
      method: :delete,
      path: "/api/catalog-categories/#{catalog_category_id}/relationships/#{related_resource}"
    }
  end

  @spec delete_item(String.t()) :: RequestOperation.t()
  def delete_item(catalog_item_id) do
    %RequestOperation{
      method: :delete,
      path: "/api/catalog-items/#{catalog_item_id}"
    }
  end

  @spec delete_item_relationships(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def delete_item_relationships(catalog_item_id, related_resource, params) do
    %RequestOperation{
      body: params,
      method: :delete,
      path: "/api/catalog-items/#{catalog_item_id}/relationships/#{related_resource}"
    }
  end

  @spec delete_variant(String.t()) :: RequestOperation.t()
  def delete_variant(catalog_variant_id) do
    %RequestOperation{
      method: :delete,
      path: "/api/catalog-variants/#{catalog_variant_id}"
    }
  end

  @spec get_category(String.t(), Enum.t()) :: RequestOperation.t()
  def get_category(catalog_category_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-categories/#{catalog_category_id}",
      query: params
    }
  end

  @spec get_category_relatinships(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def get_category_relatinships(catalog_category_id, related_resource, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-categories/#{catalog_category_id}/relationships/#{related_resource}",
      query: params
    }
  end

  @spec get_create_categories_job(String.t(), Enum.t()) :: RequestOperation.t()
  def get_create_categories_job(catalog_create_categories_job_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-category-bulk-create-jobs/#{catalog_create_categories_job_id}",
      query: params
    }
  end

  @spec get_create_items_job(String.t(), Enum.t()) :: RequestOperation.t()
  def get_create_items_job(catalog_create_items_job_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-item-bulk-create-jobs/#{catalog_create_items_job_id}",
      query: params
    }
  end

  @spec get_create_variants_job(String.t(), Enum.t()) :: RequestOperation.t()
  def get_create_variants_job(catalog_create_variants_job_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-variant-bulk-create-jobs/#{catalog_create_variants_job_id}",
      query: params
    }
  end

  @spec get_delete_categories_job(String.t(), Enum.t()) :: RequestOperation.t()
  def get_delete_categories_job(catalog_delete_categories_job_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-category-bulk-delete-jobs/#{catalog_delete_categories_job_id}",
      query: params
    }
  end

  @spec get_delete_items_job(String.t(), Enum.t()) :: RequestOperation.t()
  def get_delete_items_job(catalog_delete_items_job_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-item-bulk-delete-jobs/#{catalog_delete_items_job_id}",
      query: params
    }
  end

  @spec get_delete_variants_job(String.t(), Enum.t()) :: RequestOperation.t()
  def get_delete_variants_job(catalog_delete_variants_job_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-variant-bulk-delete-jobs/#{catalog_delete_variants_job_id}",
      query: params
    }
  end

  @spec get_item(String.t(), Enum.t()) :: RequestOperation.t()
  def get_item(catalog_item_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-items/#{catalog_item_id}",
      query: params
    }
  end

  @spec get_item_relationships(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def get_item_relationships(catalog_item_id, related_resource, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-items/#{catalog_item_id}/relationships/#{related_resource}",
      query: params
    }
  end

  @spec get_update_categories_job(String.t(), Enum.t()) :: RequestOperation.t()
  def get_update_categories_job(catalog_update_categories_job_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-category-bulk-update-jobs/#{catalog_update_categories_job_id}",
      query: params
    }
  end

  @spec get_update_items_job(String.t(), Enum.t()) :: RequestOperation.t()
  def get_update_items_job(catalog_update_items_job_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-item-bulk-update-jobs/#{catalog_update_items_job_id}",
      query: params
    }
  end

  @spec get_update_variants_job(String.t(), Enum.t()) :: RequestOperation.t()
  def get_update_variants_job(catalog_update_variants_job_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-variant-bulk-update-jobs/#{catalog_update_variants_job_id}",
      query: params
    }
  end

  @spec get_variant(String.t(), Enum.t()) :: RequestOperation.t()
  def get_variant(catalog_variant_id, params \\ []) do
    %RequestOperation{
      method: :get,
      path: "/api/catalog-variants/#{catalog_variant_id}",
      query: params
    }
  end

  @spec spawn_create_categories_job(Enum.t()) :: RequestOperation.t()
  def spawn_create_categories_job(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-category-bulk-create-jobs"
    }
  end

  @spec spawn_create_items_job(Enum.t()) :: RequestOperation.t()
  def spawn_create_items_job(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-item-bulk-create-jobs"
    }
  end

  @spec spawn_create_variants_job(Enum.t()) :: RequestOperation.t()
  def spawn_create_variants_job(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-variant-bulk-create-jobs"
    }
  end

  @spec spawn_delete_categories_job(Enum.t()) :: RequestOperation.t()
  def spawn_delete_categories_job(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-category-bulk-delete-jobs"
    }
  end

  @spec spawn_delete_items_job(Enum.t()) :: RequestOperation.t()
  def spawn_delete_items_job(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-item-bulk-delete-jobs"
    }
  end

  @spec spawn_delete_variants_job(Enum.t()) :: RequestOperation.t()
  def spawn_delete_variants_job(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-variant-bulk-delete-jobs"
    }
  end

  @spec spawn_update_categories_job(Enum.t()) :: RequestOperation.t()
  def spawn_update_categories_job(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-category-bulk-update-jobs"
    }
  end

  @spec spawn_update_items_job(Enum.t()) :: RequestOperation.t()
  def spawn_update_items_job(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-item-bulk-update-jobs"
    }
  end

  @spec spawn_update_variants_job(Enum.t()) :: RequestOperation.t()
  def spawn_update_variants_job(params) do
    %RequestOperation{
      body: params,
      method: :post,
      path: "/api/catalog-variant-bulk-update-jobs"
    }
  end

  @spec update_category(String.t(), Enum.t()) :: RequestOperation.t()
  def update_category(catalog_category_id, params) do
    %RequestOperation{
      body: params,
      method: :patch,
      path: "/api/catalog-categories/#{catalog_category_id}"
    }
  end

  @spec update_category_relationships(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def update_category_relationships(catalog_category_id, related_resource, params) do
    %RequestOperation{
      body: params,
      method: :patch,
      path: "/api/catalog-categories/#{catalog_category_id}/relationships/#{related_resource}"
    }
  end

  @spec update_item(String.t(), Enum.t()) :: RequestOperation.t()
  def update_item(catalog_item_id, params) do
    %RequestOperation{
      body: params,
      method: :patch,
      path: "/api/catalog-items/#{catalog_item_id}"
    }
  end

  @spec update_item_relationships(String.t(), String.t(), Enum.t()) :: RequestOperation.t()
  def update_item_relationships(catalog_item_id, related_resource, params) do
    %RequestOperation{
      body: params,
      method: :patch,
      path: "/api/catalog-items/#{catalog_item_id}/relationships/#{related_resource}"
    }
  end

  @spec update_variant(String.t(), Enum.t()) :: RequestOperation.t()
  def update_variant(catalog_variant_id, params) do
    %RequestOperation{
      body: params,
      method: :patch,
      path: "/api/catalog-variants/#{catalog_variant_id}"
    }
  end
end
