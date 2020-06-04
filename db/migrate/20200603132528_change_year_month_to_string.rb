class ChangeYearMonthToString < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :year_month_key, :string
  end
end
