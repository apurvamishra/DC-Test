class Datafile < ActiveRecord::Base
	attr_accessor :file

	def self.import(file)

	    name =  file.original_filename
	    directory = "public/data"

	    # create the file path
	    path = File.join(directory, name)

	    # write the file
	    File.open(path, "wb") { |f| f.write(file.read) }
 	end

end
