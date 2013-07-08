rails_depot
===========

ruby on rails + twitter bootstrap

how to add bootstrap in rails :

http://railscasts.com/episodes/328-twitter-bootstrap-basics

trouble shooting:
1 
LoadError in Products#index

Showing /home/jason/webapp/rails_project/depot/app/views/layouts/application.html.erb where line #8 raised:

cannot load such file -- less
  (in /home/jason/webapp/rails_project/depot/app/assets/stylesheets/bootstrap_and_overrides.css.less)

solution: 

https://github.com/seyhunak/twitter-bootstrap-rails

2,
jason@ubuntu:~/webapp/rails_project/depot$ rake test::units --trace
rake aborted!
Don't know how to build task 'test::units'

solution:
jason@ubuntu:~/webapp/rails_project/depot$ ruby -Itest test/unit/product_test.rb 


