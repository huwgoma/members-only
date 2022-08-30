# Members Only!
This project is part of The Odin Project's Ruby on Rails curriculum (which you can find [here](https://www.theodinproject.com/lessons/ruby-on-rails-members-only)).
This is a simple CRUD app that allows users to create, read, update, and delete posts. Authentication is implemented at various levels:
  * Users do not have to be logged in to view (read) posts; however, if they are logged in, they will be able to see the author of the post.
  * Users must be logged in to create, update, and delete posts.
  * Additionally, when editing and deleting posts, the currently logged in user must be the owner of that post.
  
Authentication is implemented using the [Devise](https://github.com/heartcombo/devise/) gem.

Basic styling was added using [Tailwind](https://tailwindcss.com/).
