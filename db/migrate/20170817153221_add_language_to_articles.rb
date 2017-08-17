class AddLanguageToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :language, :string, null: false, default: ''
  end
end
