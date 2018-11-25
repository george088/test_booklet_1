class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.text  :name
      Date.parse('2017-03-01').upto(Date.parse('2017-03-21')) do |date|

        t.integer  date.to_s.to_sym
      end

      t.timestamps
    end
  end
end
