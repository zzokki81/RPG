class CreateCharAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :char_attributes do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
