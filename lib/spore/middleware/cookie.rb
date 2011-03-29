require 'rubygems'
require 'spore/middleware'
require 'digest/sha1'

class Spore
  class Middleware
    class Cookie < Spore::Middleware

        def expected_params
          [ :cookie_name, :cookie_value, :cookie_url, :cookie_path ]
        end

        def process_request(env)
		  	cookie = self.cookie_name+"="+self.cookie_value+";"
		    env['spore.request_headers'].push({
		      :name => 'Cookie',
		      :value => cookie
		    })
		    
		    return nil
        end

      end # Authentication
  end # Middleware
end # Spore
