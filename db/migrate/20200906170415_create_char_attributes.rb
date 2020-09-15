class CreateCharAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :char_attributes do |t|
      t.references :character, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :value, null: false
      t.timestamps
    end
  end
end

