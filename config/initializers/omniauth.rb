OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1490686600958021','bf6979189d4be46172aa81ef9e4ae06a',:scope => 'user_about_me,user_location, email, user_friends, public_profile' #, :strategy_class => OmniAuth::Strategies::Facebook
  #provider :twitter, "JpbUFTGUXSpI2mCJpeMybjN1a", "kZW8083GauRwOZAdQ3K5FIyqhzRzhGHaQWuKxxXKntAEnK7l6x"
end