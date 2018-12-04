class DefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :captain, :boolean, default: false
  end
end
