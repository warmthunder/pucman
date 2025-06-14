local love = require("love")
---@diagnostic disable: lowercase-global

function button(x_button, y_button, l_button,b_button, mx, my, m_l, m_b )

    if mx+m_l>x_button and my+m_b>y_button and mx<(x_button+l_button) and my <(y_button+b_button) then
        return true   
    
else 
    return false
end
    
end
return button