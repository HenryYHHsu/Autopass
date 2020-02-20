class ActivesController < ApplicationController

    skip_before_action :verify_authenticity_token
    
    def create
        active_name = params.require(:name)
        condition = params.require(:condition) #  active_condition
        content = params.require(:content) #  active_content
        active_key = SecureRandom.hex(5).upcase # unique key for current active
        Active.create(:name => active_name,
                      :d_target => active_key)

        current_active = Active.where(d_target: active_key, name: active_name)
        current_active_id = 0 # initial 
        current_active.map {|x| current_active_id = x.id}

        # Create Active Condition table belongs_to active_id
        for i in 0..(condition.length-1)                  
            case  condition[i][:symbol]
            when 0
                condition_a_target = condition[i][:values][0]
                if (condition[i][:condition] == true)
                    ActiveCondition.create(:condition_type => 0,
                                           :limit => true,
                                           :target => condition_a_target,
                                           :active_id => current_active_id)
                else
                    condition_a_limit = condition[i][:values][1]
                    ActiveCondition.create(:condition_type => 0,
                                           :target => condition_a_target,
                                           :limitcash  => condition_a_limit,
                                           :active_id => current_active_id)
                end
            when 1
                condition_b_target = condition[i][:values][0]
                if (condition[i][:condition] == true)
                    ActiveCondition.create(:condition_type => 1,
                                           :limit => true,
                                           :target => condition_b_target,
                                           :active_id => current_active_id)
                else
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
         
        # Create Active Content table belongs to active_id
        for i in 0..(content.length-1)
            case  content[i][:symbol]
            when 0
                content_a_target = content[i][:values][0].to_i
                if (content[i][:content] == "Yes")
                content_a_discount_value = content[i][:values][1].to_i
                ActiveContent.create(:content_type => 0,
                                      :discount_way => 1,
                                      :target => content_a_target,
                                      :discountvalue => content_a_discount_value,
                                      :active_id => current_active_id)
                  
                elsif (content[i][:content] == "No")
                content_a_discount_value = content[i][:values][2].to_i
                ActiveContent.create(:content_type => 0,
                                      :discount_way => 2,
                                      :target => content_a_target,
                                      :discountvalue => content_a_discount_value,
                                      :active_id => current_active_id)
                else 
                    # need to consider data verify
                end 
            when 1
                content_b_target = content[i][:values][0].to_i
                ActiveContent.create(:content_type => 1,
                                    :target => content_b_target,
                                    :active_id => current_active_id)
            when 2
                content_c_target = content[i][:values][0].to_i
                ActiveContent.create(:content_type => 2,
                                    :target => content_c_target,
                                    :active_id => current_active_id)
            when 3
                content_d_target = content[i][:values][1].to_i
                condition_d_store_id = content[i][:values][0].to_i
                if (content[i][:content] == "Yes")
                  content_d_discount_value = content[i][:values][2].to_i
                  ActiveContent.create(:content_type => 3,
                                        :target => content_d_target,
                                        :discount_way => 1,
                                        :discountvalue => content_d_discount_value,
                                        :store_id =>condition_d_store_id,
                                        :active_id => current_active_id)
                elsif (content[i][:content] == "No")
                  content_d_discount_value = content[i][:values][3].to_i
                  ActiveContent.create(:content_type => 3,
                                        :target => content_d_target,
                                        :discount_way => 2,
                                        :discountvalue => content_d_discount_value,
                                        :store_id => condition_d_store_id,
                                        :active_id => current_active_id)
                end
            when 4
                content_e_target = content[i][:values][1].to_i
                condition_e_product_id = content[i][:values][0].to_i
                if (content[i][:content] == "Yes")
                  content_e_discount_value = content[i][:values][2].to_i
                  ActiveContent.create(:content_type => 4,
                                        :target => content_e_target,
                                        :discount_way => 1,
                                        :discountvalue => content_e_discount_value,
                                        :product_id =>condition_e_product_id,
                                        :active_id => current_active_id)
                elsif (content[i][:content] == "No")
                  content_e_discount_value = content[i][:values][3].to_i
                  ActiveContent.create(:content_type => 4,
                                        :target => content_e_target,
                                        :discount_way => 2,
                                        :discountvalue => content_e_discount_value,
                                        :product_id => condition_e_product_id,
                                        :active_id => current_active_id)
                end
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
