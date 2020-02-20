class ActivesController < ApplicationController

    skip_before_action :verify_authenticity_token
    
    def create
        active_name = params.require(:name)
        condition = params.require(:condition) #  active_condition
        content = params.require(:content) #  active_content
        active_key = SecureRandom.hex(5).upcase
        puts active_key.class
        Active.create(:name => active_name,
                      :d_target => active_key)
        puts "--------Create-----------"
        current_active = Active.where(d_target: active_key, name: active_name)
        puts "--------result-----------"
        current_active_id = 0 # initial 
        current_active.map do |x| 
            current_active_id = x.id
        end
        puts "--------Find-----------"
        puts current_active_id
        puts "-----------End---------"
        for i in 0..(condition.length-1)                  
            case  condition[i][:symbol]
            when 0
                condition_a_target = condition[i][:values][0]
                if (condition[i][:condition] == true)
                    condition_a_type = condition[i][:condition]
                    ActiveCondition.create(:condition_type => 0,
                                           :limit => true,
                                           :target => condition_a_target,
                                           :active_id => current_active_id)
                else
                    condition_a_type = condition[i][:condition]
                    condition_a_limit = condition[i][:values][1]
                    ActiveCondition.create(:condition_type => 0,
                                           :target => condition_a_target,
                                           :limitcash  => condition_a_limit,
                                           :active_id => current_active_id)
                end
            when 1
                condition_b_target = condition[i][:values][0]
                if (condition[i][:condition] == true)
                    condition_b_type = condition[i][:condition]
                    ActiveCondition.create(:condition_type => 1,
                                           :limit => true,
                                           :target => condition_b_target,
                                           :active_id => current_active_id)
                else
                    condition_b_type = condition[i][:condition]
                    condition_b_limit = condition[i][:values][1]
                    ActiveCondition.create(:condition_type => 1,
                                           :target => condition_b_target,
                                           :limitcash  => condition_b_limit,
                                           :active_id => current_active_id)
                end
            when 2
                condition_c_start  = condition[i][:values][0].to_time
                condition_c_end  = condition[i][:values][1].to_time
                    ActiveCondition.create(:condition_type => 2,
                                           :start_datetime => condition_c_start,
                                           :end_datetime => condition_c_end,
                                           :active_id => current_active_id)
            when 3
                condition_d_target  = condition[i][:values][0].to_i
                    ActiveCondition.create(:condition_type => 3,
                                           :target => condition_d_target,
                                           :active_id => current_active_id)     
            when 4
                condition_e_target  = condition[i][:values][0].to_i
                    ActiveCondition.create(:condition_type => 4,
                                           :target => condition_e_target,
                                           :active_id => current_active_id)    
            else
            end
        end
        

        for i in 0..(content.length-1)
            case  content[i][:symbol]
            when 0
                
            when 1
                puts "1"
            when 2
                puts "2"
            when 3
                puts "3"
            when 4
                puts "4"
            else
            end
        end
        puts "-----------------------------"
        puts active_name
        puts "-----------------------------"
        puts condition
        puts "-------------------------------"
        puts content
        puts "-------------------------------"
        render json: {foodlike: false}
    end
end
