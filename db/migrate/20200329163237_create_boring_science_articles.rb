class CreateBoringScienceArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :boring_science_articles do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
