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
    endpoint:               'https://s3.amazonaws.com' ,
    region:                 ENV['AWS_REGION'],
    path_style:true
  }
  
  config.remove_previously_stored_files_after_update = false

  config.fog_directory = ENV['AWS_S3_BUCKET']
  config.asset_host = 'https://eureka-image.s3-ap-northeast-1.amazonaws.com'

end
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end