class AddLinkToPortfolios < ActiveRecord::Migration[5.0]
  def change
    add_column :portfolios, :link, :string
  end
end
