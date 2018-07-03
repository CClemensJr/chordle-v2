class ChoresController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

    def create
        @chore = current_user.chores.build(chore_params)

        if @chore.save
            flash[:success] = "Chordle added a new chore to your list!"
            redirect_to current_user
        end
    end

    def destroy
        @chore = Chore.find(params[:id])
        @chore.destroy
        flash[:success] = "Chordle removed a chore to your list!"
        redirect_to current_user
    end


    private


    def chore_params
        params.require(:chore).permit(:description, :priority, :time_to_complete)
    end
end
