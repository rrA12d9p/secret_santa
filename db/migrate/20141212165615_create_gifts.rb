class CreateGifts < ActiveRecord::Migration
  def change
  	create_table :gifts do |g|
      g.string :title, null: false
      g.text :desc, default: ""
      g.timestamps
    end
  end
end