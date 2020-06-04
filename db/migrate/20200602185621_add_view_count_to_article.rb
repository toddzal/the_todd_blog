class AddViewCountToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :view_count, :integer
    add_column :articles, :year_month, :integer
  end
end
