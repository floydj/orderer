class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :models do |t|
      t.references :product, null: false, foreign_key: true
      t.string :title
      t.integer :display

      t.timestamps
    end
  end
end
