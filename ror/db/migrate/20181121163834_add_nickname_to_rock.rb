class AddNicknameToRock < ActiveRecord::Migration[5.2]
  def change
    #operation :table, **options
    # create_table
    # alter_table
    # alter_column
    # etc.
    add_column :rocks, :nickname, :string
    #tabela, nazwa, rodzaj
  end
end
