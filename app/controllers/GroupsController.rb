class GroupsController < ApplicationController

    def new
        binding.pry
        @group = Group.new
    end

    def create
        @group = Group.create(group_params)
        @user = current_user
        #@recipe = current_user.recipes
        if @group.valid?
            @user.groups << @group #error is here
            redirect_to user_groups_path(@user.id)
        else
            render '/groups/new'
        end
    end

    private

    def group_params
        params.require(:group).permit(:name)
    end
end