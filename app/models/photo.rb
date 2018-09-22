require 'mini_magick'
require 'digest/md5'

class Photo < ActiveRecord::Base
	
	attr_accessor :binary, :original_filename
	PHOTOS_DIR = "#{RAILS_ROOT}/public/photos"

	
	#relations
	belongs_to :store
	
	# validates
	validates_presence_of :title
	# validates_format_of :content_type, :with => /^image/, :message => '画像以外のアップロードは出来ません'

	#act_as
	acts_as_taggable
		
	def photo=(file)
		if file.kind_of?(Tempfile)
			self.filename = sanitize_filename(file.original_filename)
			self.original_filename = file.original_filename
			self.binary = file.read
		end
  end

	def save
		unless self.binary.nil?
			save_photo
			image_crop
		end
		self.title = self.original_filename if self.title.nil? or self.title.empty?
		super
	end
	
	def save_photo
		save_dir = "#{PHOTOS_DIR}/#{self.store_id}" 
		#Make the directory for the id
		Dir.mkdir(save_dir) unless File.exist?(save_dir)
		File.open("#{save_dir}/#{self.original_filename}", "wb"){ |f| f.write(binary) }
	end

	def image_crop
		
		save_dir = "#{PHOTOS_DIR}/#{self.store_id}"
		#find the extension for this file
		extention = File.extname(self.filename)
		just_filename = File.basename(self.filename, extention)
		image = MiniMagick::Image.from_file("#{save_dir}/#{self.original_filename}")
		
		image.resize "400X300"
		image.write("#{save_dir}/#{just_filename}#{extention}")  

		image.resize "240X180"
		image.write("#{save_dir}/#{just_filename}_m#{extention}")  
		
		image.resize "180X135"
		image.write("#{save_dir}/#{just_filename}_s#{extention}")  

		image.resize "100X75"
		image.write("#{save_dir}/#{just_filename}_t#{extention}") 
				
		#Finally, rename the originally uploaded image
		File.rename("#{save_dir}/#{self.original_filename}", "#{save_dir}/#{just_filename}_o#{extention}")
		File.chmod(0644, "#{save_dir}/#{just_filename}#{extention}", "#{save_dir}/#{just_filename}_m#{extention}", "#{save_dir}/#{just_filename}_s#{extention}", "#{save_dir}/#{just_filename}_t#{extention}")
	end

	private
	def sanitize_filename(file_name)
		# get only the filename, not the whole path (from IE)
		extention = File.extname(file_name)
		just_filename = File.basename(file_name, extention)
		just_filename = Digest::MD5.hexdigest(just_filename) + extention
		# replace all non-alphanumeric, underscore or periods with underscores
		# just_filename.gsub(/[^\w\.\-]/,'_') 
	end
end