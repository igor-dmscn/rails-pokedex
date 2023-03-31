class CreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|
      t.string :name, null: false
      t.belongs_to :master_trainer, null: true, foreign_key: { to_table: :trainers }
      
      t.timestamps
    end
  end
end
