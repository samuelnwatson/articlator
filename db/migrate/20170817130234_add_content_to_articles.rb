class AddContentToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :content, :string, null: false, default: ''
  end
end
