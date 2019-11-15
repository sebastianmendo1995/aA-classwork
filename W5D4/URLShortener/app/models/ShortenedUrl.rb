# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#
# Indexes
#
#  index_shortened_urls_on_short_url_and_user_id  (short_url,user_id) UNIQUE
#  index_shortened_urls_on_user_id                (user_id)
#

class ShortenedUrl < ApplicationRecord

  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
  validates :user_id, presence: true

  def self.random_code
    loop do 
      random_code = SecureRandom.urlsafe_base64
      return random_code unless ShortenedUrl.exists?(short_url: random_code)
    end
  end

  def self.random_short_url(user, long_url)
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User 

end
