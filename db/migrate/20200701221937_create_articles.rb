class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.references :author, index: true, null: false
      t.string :title, null: false
      t.text :text, null: false
      t.string :image, null: false
      t.datetime :created_at, null: false

      t.timestamps
    end
  end
end
