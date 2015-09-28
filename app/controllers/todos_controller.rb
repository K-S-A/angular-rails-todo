class TodosController < ApplicationController

def index
  @user = current_user
  @todos = @user.todos if @user
end

def create
  @user = current_user
  @todo = @user.todos.create(todo_params) if @user
end

def show
  @user = current_user
  @todo = @user.todos.find(params[:id]) if @user
  render 'todos/create'
end

def update
  @user = current_user
  @todo = @user.todos.find(params[:id]) if @user
  @todo.update_attributes(todo_params) if @todo
  render 'todos/create'
end

def destroy
  @user = current_user
  @todo = @user.todos.find(params[:id]) if @user
  @todo.destroy

  render nothing: true
end



private

  def todo_params
    params.require(:todo).permit(:title, :description, :priority, :status, :due_date)
  end

end
