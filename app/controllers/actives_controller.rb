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
                condition_a_status = condition[i][:status]
                condition_a_target = condition[i][:values][0]
                if (condition[i][:condition] == true)
                    condition_a_type = condition[i][:condition]
                else
                    condition_a_type = condition[i][:condition]
                    condition_a_limit = condition[i][:values][1]
                end
            when 1
                condition_b_status = condition[i][:status]
                condition_b_target = condition[i][:values][0]
                if (condition[i][:condition] == true)
                    condition_b_type = condition[i][:condition]
                else
                    condition_b_type = condition[i][:condition]
                    condition_b_limit = condition[i][:values][1]
                end
            when 2
                condition_c_status = condition[i][:status]
                condition_c_start  = condition[i][:values][0].to_time
                condition_c_end  = condition[i][:values][1].to_time
            when 3
                condition_d_status = condition[i][:status]
                condition_d_target  = condition[i][:values]
            when 4
                condition_e_status = condition[i][:status]
                condition_e_target  = condition[i][:values]
            else
            end
        end
        
        # Active.create(:name => active_name)

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
