class Createrecipe < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.string :link
      t.integer :user_id
      t.integer :group_id
    end
  end
end
