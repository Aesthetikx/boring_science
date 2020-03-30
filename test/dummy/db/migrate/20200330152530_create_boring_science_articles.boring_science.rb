# This migration comes from boring_science (originally 20200329163237)
class CreateBoringScienceArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :boring_science_articles do |t|
      t.string :blog, null: false, index: true
      t.string :title, null: false
      t.string :summary
      t.text :body, null: false
      t.date :publication_date
      t.string :slug, null: false, index: { unique: true }
      t.references :author, polymorphic: true, index: true

      t.timestamps
    end
  end
end
