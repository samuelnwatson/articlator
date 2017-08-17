class AddTitleToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :title, :string, null: false, default: ''
  end
end
