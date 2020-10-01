require 'carrierwave'
require 'carrierwave/orm/activerecord'

config.fog_credentials = {
  provider:              'AWS',
  aws_access_key_id:     ENV[aws_access_key_id],
  aws_secret_access_key: ENV[aws_secret_access_key],
  region:                ['ARTIFACTS_REGION']
 }
