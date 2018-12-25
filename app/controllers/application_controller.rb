class ApplicationController < ActionController::Base

    def hello 
        render plain: "Heeeeey!!"
    end

    def goodbye
        render plain: "Bye!"    
    end

end
