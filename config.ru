require './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

use Rack::MethodOverride #In order to use this middleware, and therefore use PATCH, PUT, and DELETE requests

run ApplicationController
