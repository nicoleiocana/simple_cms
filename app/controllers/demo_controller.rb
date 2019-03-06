class DemoController < ApplicationController
  
  def index
    render 'index'
  end
  
  def hello
    render 'hello'
  end
  
  def other_hello
    redirect_to action: 'hello'
  end
  
  def lynda
    redirect_to 'http:lynda.com'
  end
  
  def escape_output
  end
end
