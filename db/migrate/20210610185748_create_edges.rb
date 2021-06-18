class CreateEdges < ActiveRecord::Migration[5.2]
  def change
    create_table :edges do |t|
      t.references :step, foreign_key: true
      t.references :goal, foreign_key: true
      t.float :similarity

      t.timestamps
    end
  end
end
