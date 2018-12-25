class ApplicationController < ActionController::Base

    def hello 
        render plain: "Heeeeey!!"
    end

    def goodbye
        render plain: "Здорова, Кобан!"    
    end

end
