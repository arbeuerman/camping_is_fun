class SignupsController < ApplicationController

    def new
        @signup = Signup.new

        @campers = Camper.all
        @activities = Activity.all
    end

    def create
        @signup = Signup.new(params.require(:signup).permit(:camper_id, :activity_id, :hour_of_activity))
        if @signup.valid?
            @signup.save
            redirect_to camper_path(@signup.camper)
        else
            #use flash hash to pass along errors
            flash[:errors] = @signup.errors.full_messages
            redirect_to new_signup_path
        end
    end

end
