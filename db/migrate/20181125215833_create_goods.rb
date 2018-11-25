class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string  :name
      2017-03-01
      2017-03-21
      20170301.upto(20170321) do |i|

        t.string  :label
        t.text    :value
        t.string  :type
        t.integer :position
      end

      t.timestamps
    end
  end
end
