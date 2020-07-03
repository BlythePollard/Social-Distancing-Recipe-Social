class CreateSavedRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_recipes do |t|
        t.string :title
        t.string :description
        t.string :link
        t.integer :user_id
    end
  end
end
