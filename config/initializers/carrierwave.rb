require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id:      ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'],
    region:                 'ap-northeast-1',
    
  }
  config.fog_public     = true # public-read
  config.remove_previously_stored_files_after_update = false

  config.fog_directory = 'eureka-image'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/eureka-image'

end
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end