# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.


set :stage, :production
set :rails_env, 'production'

server 'tabimuseWebApp', user: 'ec2-user', roles: %w{web app db}
set :ssh_options, {
  keys: [File.expand_path('~/.ssh/muse_webapp.pem')]
}


