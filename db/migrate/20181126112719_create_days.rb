class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.date :date
      t.decimal :revenue
      t.references :good, foreign_key: true

      t.timestamps
    end
  end
end
