defmodule ElixirGist.Repo.Migrations.CreateTbComments do
  use Ecto.Migration

  def change do
    create table(:tb_comments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :markup_text, :text
      add :user_id, references(:tb_users, on_delete: :delete_all, type: :binary_id)
      add :gist_id, references(:tb_gists, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:tb_comments, [:user_id])
    create index(:tb_comments, [:gist_id])
  end
end
