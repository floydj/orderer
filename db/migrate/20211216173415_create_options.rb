class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :display
      t.string :title

      t.timestamps
    end
  end
end
