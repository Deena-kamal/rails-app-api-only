class V2::TodosController < ApplicationController
    def index
      json_response({ message: 'Todos from version 2'})
    end
end