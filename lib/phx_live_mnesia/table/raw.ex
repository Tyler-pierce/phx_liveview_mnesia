defmodule PhxLiveMnesia.Table.Raw do
  @moduledoc """
  Example Table to be built by Mnesia Setup. Showing holding (any) raw data with a 
  source and helpers to create a primary key or date
  """
  use Memento.Table,
    attributes: [:id, :source, :created_at, :raw],
    index: [:source, :created_at],
    type: :ordered_set

  @doc """
  Generate a primary key for the record. Needs only the source of the raw data as a string
  """
  def gen_pk(), do: UUID.uuid4()

  def datetime_key(), do: Timex.format!(Timex.now(), "{ISO:Extended}")
end