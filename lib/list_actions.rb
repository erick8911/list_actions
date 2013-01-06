require "list_actions/version"

module ListActions
  # Your code goes here...
  
  def self.csv
    Rails.application.eager_load!  ##Load all the controllers
    application_actions = ApplicationController.action_methods.to_a  #Actions inside application controller
    controllers = ApplicationController.subclasses 
    
    controller_actions = []
    controller_action = {}
    
    controllers.each do |controller| 
      actions_controller = controller.action_methods.to_a - application_actions  #Delete all application acctions
      actions = []
      actions_controller.each do |action|
        actions <<  controller.to_s+ "_" + action.to_s  ##Add de controller name to the action
      end
      controller_action[controller] = actions  ##List all the actions in a hash
      controller_actions << actions ##List all the actions in an array
    end
    
    
    CSV.open("all_my_actions.csv", "wb") do |csv|
      controller_action.each do |key, value|
        puts "---------"
        puts key
        csv << value
      end
    end
  end  
end
