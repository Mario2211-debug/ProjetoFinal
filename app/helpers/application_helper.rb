module ApplicationHelper

       def tab_link?(test_path)
         return 'link-active' if request.path == test_path
         ''
       end

       def side_link?(test_path)
         return 'side-active' if request.path == test_path
         ''
       end

end
