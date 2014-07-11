class CreateGalleries < ActiveRecord::Migration
  def up
    create_table :galleries do |t|
    	t.string "name"
    	t.integer "position"
    	t.boolean "visibility", :default=>false
    	t.text "description"
    	t.attachment :photo

      t.timestamps
    end
  end

  def down
  	drop_table :galleries
  end
end
