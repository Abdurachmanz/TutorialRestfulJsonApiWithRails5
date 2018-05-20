class CreateLukisans < ActiveRecord::Migration[5.2]
  def change
    create_table :lukisans do |t|
      t.string :title
      t.text :desription
      t.string :created_by

      t.timestamps
    end
  end
end
