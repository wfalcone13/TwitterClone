# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#
# Indexes
#
#  index_tweets_on_author_id  (author_id)
#

class Tweet < ApplicationRecord

  validates :body, :author_id, presence: true 

  belongs_to :user,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: 'User'

  has_many :likes,
  primary_key: :id,
  foreign_key: :tweet_id,
  class_name: 'Like'


end 
