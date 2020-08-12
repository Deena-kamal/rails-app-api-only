class TodosController < ApplicationController 

    # using only here to specify before using which methos should this fn be called
    before_action :set_todo, only: [:show, :update, :destroy]

    def new 
        @todo = Todo.new
    end

    def show
        json_response(@todo)
    end

    def index
        @todos = Todo.all
        json_response(@todos)
    end

    def create
        # using create! instead of create -> will raise an exception record invalid which will be catched in exception handler
        @todo = Todo.create!(todo_params)
        json_response(@todo, :created)
    end

    def update
        @todo.update(todo_params)
        head :no_content
      end
    
    # DELETE /todos/:id
    def destroy
        @todo.destroy
        head :no_content
    end


    private 
        def todo_params
            # whitelist params
            params.permit(:title, :created_by)
        end
    
        def set_todo
            @todo = Todo.find(params[:id])
        end
end
