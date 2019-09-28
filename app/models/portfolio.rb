class Portfolio < ApplicationRecord
	has_many :technologies
	
	accepts_nested_attributes_for :technologies, reject_if: lambda {|attr| attr['name'].blank? }
	include Placeholder
	validates_presence_of :title, :body, :thumb_image, :main_image

	def self.anguler
		where(subtitle: "Angulerjs")
	end

	# def self.ror
	# 	where(subtitle: "Ruby on Rails")
	# end

	scope :ruby, -> {where(subtitle: "Ruby on Rails")}

	after_initialize :set_defaults

	def set_defaults
		self.thumb_image ||=Placeholder.image_generator(height: '150')
		self.main_image ||= Placeholder.image_generator(height: '350')
	end

end
