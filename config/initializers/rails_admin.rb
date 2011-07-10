RailsAdmin.authorize_with do
  redirect_to :root unless warden.user.admin?
end

RailsAdmin.config do |config|
end
