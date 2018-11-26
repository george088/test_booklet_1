class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.string :date
      t.integer :revenue
      t.references :good, foreign_key: true

      t.timestamps
    end
  end
end
