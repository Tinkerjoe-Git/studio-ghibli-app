require './config/environment'



use Rack::MethodOverride


use ReviewController
use UserController
use GhibliController
run ApplicationController
