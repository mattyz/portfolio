class CreatePortmanteaus < ActiveRecord::Migration[6.0]
  def change
    create_table :portmanteaus do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end
