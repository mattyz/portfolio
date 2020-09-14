class AddPositionToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portmanteaus, :position, :integer
  end
end
