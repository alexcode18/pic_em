class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
    	t.string :username
    	t.string :password_digest
    	t.string :img_url
			t.string :bio
			t.string :location
			
			t.timestamps
    end
  end
end
