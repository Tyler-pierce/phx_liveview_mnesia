defmodule PhxLiveMnesia.Query.Raw do
	@moduledoc """
	Query the raw data table
	"""
	alias PhxLiveMnesia.Table.Raw, as: RawTable

  @doc """
  Insert a record
  """
  def insert(source, raw_data) do
    Memento.transaction! fn ->
      Memento.Query.write(%RawTable{
        id: RawTable.gen_pk(), 
        source: source,
        created_at: RawTable.datetime_key(),
        raw: raw_data})
    end
  end

  @doc """
  Query a row by it's ID
  """
  def read(id, opts \\ []) do
    Memento.transaction! fn -> 
      Memento.Query.read(PhxLiveMnesia.Table.Raw, id) 
      |> apply_opts(opts)
    end
  end

  @doc """
  Apply options to a query result
  """
  def apply_opts(result, []), do: result

  def apply_opts(result, [{:field, field}|opts]) do
    apply_opts(Map.get(result, field), opts)
  end

  def apply_opts(result, _), do: result
end