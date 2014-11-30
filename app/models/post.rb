class Post < ActiveRecord::Base
	belongs_to :author
	has_and_belongs_to_many :tags

	validates_presence_of :title, :author_id

	def add_date()
			self.created_at.strftime("%b/%d/%y")
	end

	def good?
		if include? :words || :img_url
		end
	end

end