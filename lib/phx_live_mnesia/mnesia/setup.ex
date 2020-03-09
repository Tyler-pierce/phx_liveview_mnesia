defmodule PhxLiveMnesia.Mnesia.Setup do
  @moduledoc """
  Setup and initialization tasks for mnesia
  """
  alias PhxLiveMnesia.Table.{Raw}


  @doc """
  Creates the Mnesia Database for PhxLiveMnesia on disk

  ```
  iex(PhxLiveMnesia@host_x)1> nodes = [node() | Node.list]
  [:my_app@host_x, :my_app@host_y, :my_app@host_z]

  iex(PhxLiveMnesia@node_x)2> PhxLiveMnesia.Mnesia.Setup.setup!(nodes)
  :ok
  ```
  """
  def setup!(nodes \\ [node()|Node.list()]) do
    # Create the DB directory (if custom path given)
    if path = Application.get_env(:mnesia, :dir) do
      :ok = File.mkdir_p!(path)
    end

    # Create the Schema
    Memento.stop()
    Memento.Schema.create(nodes)
    Memento.start()

    # Create the DB with Disk Copies
    # TODO:
    # Use Memento.Table.wait when it gets implemented
    # @db.create!(disk: nodes)
    # @db.wait(15000)
    Memento.Table.create!(Raw, disc_copies: nodes)
  end

  @doc """
  Resets the schema (Beware! Data will be destroyed). Mainly for testing.
  Data in the folder must be removed manually if wished.
  """
  def reset!(nodes \\ [node()|Node.list()]) do
    Memento.stop()
    Memento.Schema.delete(nodes)
  end

  # Callbacks in Table Definition
  # -----------------------------


  # Make sures that the DB exists (either
  # in memory or on disk)
  @doc false
  def initialize() do
    Memento.Table.create(Raw)
  end
end