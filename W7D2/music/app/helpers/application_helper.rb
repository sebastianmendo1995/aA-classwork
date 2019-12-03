module ApplicationHelper
    #You always have to pass this for everything that is not a get request
    def auth_token
        "<input type='hidden' name='authenticity_token' 
        value='<%= form_authenticity_token%>' />".html_safe
    end
end
