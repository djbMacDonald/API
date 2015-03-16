class AmazonController < ApplicationController

  def sign_key
    render json: get_s3_upload_key
  end

  private

  def get_s3_upload_key
    bucket = ENV['MYBUCKET']
    key = "uploads/#{SecureRandom.uuid}"
    policy = Base64.encode64(
      "{'expiration': '#{30.minutes.from_now.utc.strftime('%Y-%m-%dT%H:%M:%S.000Z')}',
      'conditions': [
        {'bucket': '#{ENV['MYBUCKET']}'},
        ['starts-with', '$key', '#{key}'],
        ['starts-with', '$Content-Type', 'image/jpeg'],
        ['content-length-range', 0, 10485760],
      ]}").gsub(/\n|\r/, '')
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'), ENV['S3_SECRET_ACCESS_KEY'], policy)).gsub(/\n| |\r/, '')
    return { access_key: ENV['S3_ACCESS_KEY'], key: key, policy: policy, signature: signature, bucket: bucket}
  end

end
