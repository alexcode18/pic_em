class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
			t.string :img_url
			t.string :title
			t.string :words
			t.references :author

			t.timestamps
    end
  end
end
