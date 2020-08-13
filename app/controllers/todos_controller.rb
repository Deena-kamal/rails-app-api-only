class TodosController < ApplicationController 

    # using only here to specify before using which methos should this fn be called
    before_action :set_todo, only: [:show, :update, :destroy]

    def new 
        @todo = Todo.new
    end

    def show
        if @todo
            authorize @todo
            json_response(@todo)
        else
            # if we are using after action verify authorization and we want to skip it on a condition use this
            # for skipping policy scoope use skip_policy_scope
            skip_authorization
        end
    end

    def index
        @todos = policy_scope(current_user.todos.paginate(page: params[:page], per_page: 20))
        # to retreive all names for the fisrt todo
        # @todos = current_user.todos.first().items.pluck :name
        json_response(@todos)
    end

    def create
            @todo = current_user.todos.create!(todo_params)
            json_response(@todo, :created)
    end

    def update

        # also i can check dirrectly if its authorized to do this action or not through
        # policy(@post).update? 
        authorize @todo, :checkUpdateWithDiffName?
        if @todo.update!(todo_params)
            puts "user is authorized to update todo"
            head :no_content
        else 
            puts "user is not authorized to update todo"
        end
    end
    
    # DELETE /todos/:id
    def destroy
        @todo.destroy
        head :no_content
    end


    private 
        def todo_params
            # whitelist params
            params.permit(:title)
        end
    
        def set_todo
            @todo = Todo.find(params[:id])
        end
end
