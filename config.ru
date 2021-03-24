require './config/environment'



use Rack::MethodOverride
use ReviewController
use UserController
run ApplicationController
