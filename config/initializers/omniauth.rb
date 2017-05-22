OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '311877949248617','46ec0a9b2b6dc258828332fa2cafd6cc',:scope => 'user_about_me,user_location, email, user_friends, public_profile' #, :strategy_class => OmniAuth::Strategies::Facebook
  #provider :twitter, "JpbUFTGUXSpI2mCJpeMybjN1a", "kZW8083GauRwOZAdQ3K5FIyqhzRzhGHaQWuKxxXKntAEnK7l6x"
end
