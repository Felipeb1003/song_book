require './config/environment'
require_relative 'app/controllers/users_controller'
require_relative 'app/controllers/songs_controller'
require_relative 'app/controllers/setlists_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

use SetlistsController
use UsersController
use SongsController
run ApplicationController
 
