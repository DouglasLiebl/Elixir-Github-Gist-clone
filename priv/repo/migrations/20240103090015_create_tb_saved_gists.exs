defmodule ElixirGist.Repo.Migrations.CreateTbSavedGists do
  use Ecto.Migration

  def change do
    create table(:tb_saved_gists, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, references(:tb_users, on_delete: :delete_all, type: :binary_id)
      add :gist_id, references(:tb_gists, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:tb_saved_gists, [:user_id])
    create index(:tb_saved_gists, [:gist_id])
  end
end
