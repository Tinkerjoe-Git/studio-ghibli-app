require './config/environment'



use Rack::MethodOverride
use GhibliController
use ReviewController
use UserController
use SessionsController
run ApplicationController
