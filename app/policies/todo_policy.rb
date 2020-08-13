class TodoPolicy < ApplicationPolicy
  attr_reader :user, :todo

  class Scope < Scope
    def resolve
      if user.email == "dina.kamal@modeso.ch" 
        scope.all
      else
        scope.where(title: "first one for second user try to edit")
      end
    end
  end

  def checkUpdateWithDiffName?
    # give the permission to edit only for 2 specific users
    user.email == "dina.kamal@modeso.ch" || user.name == "Deena12"
  end
end