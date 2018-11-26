class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :players, :capitan, :captain
  end
end
