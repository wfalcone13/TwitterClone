json.extract! tweet, :id, :body, :author_id
json.likes tweet.likes.count 
json.liked_by_current_user !!tweet.likes.find_by(user_id: current_user.id)