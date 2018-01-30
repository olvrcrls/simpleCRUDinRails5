class Article < ApplicationRecord
	has_many :comment
	validates :title, presence: true, length: { minimum: 5 } 
	# $this->validates(['title' => 'min:5|required:true'])
end
