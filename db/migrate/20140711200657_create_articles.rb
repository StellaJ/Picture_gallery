class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
    	t.integer "page_id"
    	t.string "name"
    	t.integer "position"
    	t.boolean "visibility", :default=>true
    	t.text "content"
    	t.attachment :photo

      t.timestamps
    end
  end
  def down
  	drop_table :articles
  end
end
