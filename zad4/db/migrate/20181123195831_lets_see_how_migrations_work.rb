class LetsSeeHowMigrationsWork < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:players, :captain, :false)
  end
end
