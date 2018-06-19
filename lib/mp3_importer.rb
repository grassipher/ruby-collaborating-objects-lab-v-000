class MP3Importer
  
  attr_reader :path, :files
  
  def initialize (filepath)
    @path = filepath
    @files = []
  end
  
  def files
    Dir.glob("#{@path}/**/*.mp3").each do |file|
      @files << file
    end
    @files.each do |file_name|
      file_name.gsub!(/.\/spec\/fixtures\/mp3s\//,"")
    end
  end
  
  def import
    @files.each do |file|
      Song.new_by_filename(file)
    end
  end
  
end