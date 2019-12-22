# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_likes_on_tweet_id_and_user_id  (tweet_id,user_id) UNIQUE
#

class Like < ApplicationRecord

  validates :tweet_id, :user_id, presence: true 

  belongs_to :tweet,
  primary_key: :id,
  foreign_key: :tweet_id,
  class_name: 'Tweet'

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: 'User'

end 
