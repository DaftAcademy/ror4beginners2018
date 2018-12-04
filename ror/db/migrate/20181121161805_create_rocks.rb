class CreateRocks < ActiveRecord::Migration[5.2]
  def change
    create_table :rocks do |t|
      #t.type :column, **options
      t.float :weight, null: false #null: false sprawdza czy rekord może należeć to bazy czy nie
                                   #jesli wartosc weight bedzie nullem, to znaczy ze jest problem
      t.timestamps #trzyma created_at i updated_at, lepiej nie usuwac
    end
  end
end
