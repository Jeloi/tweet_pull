class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :number
      t.string :name
      t.string :username
      t.string :label
      t.float :label_number

      t.timestamps
    end
  end
end
