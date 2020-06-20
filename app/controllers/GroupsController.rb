class GroupsController < ApplicationController

    def new
        @group = Group.new
    end

    def create
        @group = Group.create(group_params)
        @user = current_user
        if @group.valid?
            @user.groups << @group #error is here
            redirect_to user_path(@user.id)
        else
            render '/groups/new'
        end
    end

    def show
        @group = Group.find_by(id: params[:id])
        @recipes = @group.recipes
        @user = current_user
    end

    def addgroup
    end

    def searchgroup
        if @group = Group.find_by(id: params[:groupid])
            current_user.groups << @group
            redirect_to user_path(current_user.id)
        else
            flash[:notice] = "Group not found"
        end
    end

    private

    def group_params
        params.require(:group).permit(:name)
    end
end