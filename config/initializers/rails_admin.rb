RailsAdmin.config do |c|
  c.authorize_with do
    redirect_to :root unless warden.user.admin?
  end
end
