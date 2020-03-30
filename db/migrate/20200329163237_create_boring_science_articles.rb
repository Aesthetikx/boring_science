class CreateBoringScienceArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :boring_science_articles do |t|
      t.string :blog, null: false
      t.string :title, null: false
      t.string :summary
      t.text :body, null: false
      t.date :publication_date
      t.string :slug, null: false
      t.references :author, polymorphic: true

      t.index :blog
      t.index :slug, unique: true
      t.index :author

      t.timestamps
    end
  end
end
