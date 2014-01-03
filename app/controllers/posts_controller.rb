class PostsController < ApplicationController
before_filter :authenticate, :except => [ :index, :show ]
end

def show
  @post = Post.find(params[:id])
  <b>@comment = Comment.new( :post => @post )</b>

  <hr />
<% form_for @comment do|f| %>
  <%= f.error_messages %>
  <%= f.hidden_field :post_id %>

  <p>
  <%= f.label :name %><br />
  <%= f.text_field :name %>
  </p>
 
  <p>
    <%= f.label :email %><br />
    <%= f.text_field :email %>
  </p>
 
  <p>
    <%= f.label :body %><br />
    <%= f.text_area :body %>
  </p>
 
  <p>
    <%= f.submit "Post Comment" %>
  </p>
<% end %>

def new
end
