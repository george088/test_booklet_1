class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.text :title

      t.timestamps
    end
  end
end
