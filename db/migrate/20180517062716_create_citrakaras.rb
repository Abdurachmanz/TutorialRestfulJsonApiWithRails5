class CreateCitrakaras < ActiveRecord::Migration[5.2]
  def change
    create_table :citrakaras do |t|
      t.string :title
      t.string :created_by

      t.timestamps
    end
  end
end
