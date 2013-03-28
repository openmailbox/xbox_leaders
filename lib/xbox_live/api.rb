class XboxLive::Api
  FORMATS = %w(json xml php)
  API_URI = 'https://www.xboxleaders.com/api'

  attr_accessor :format, :timeout
  
  def initialize(format: 'json', timeout: 6)
    self.format = format
    @timeout = timeout
  end

  def format=(new_format)
    unless FORMATS.include?(new_format)
      raise ArgumentError, "Invalid format. Must be one of: #{FORMATS.join(', ')}."
    end
    @format = new_format
  end

  def fetch_profile(gamertag)
  end

  private

  def http(path, *args)
  end
end
