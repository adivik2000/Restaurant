class DishesController < ApplicationController
  include DishesHelper

  def create
    @dish = Dish.new(params[:dish])
      if @dish.save
      flash[:notice] = "Successfully created dish."        
      redirect_to :controller => 'admin/menus', :action => 'edit', :id => @dish.menu_id
      else
       render 'admin/dishes/new'
      end
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update_attributes(params[:dish])
      flash[:notice] = "Successfully updated dish."
      redirect_to :controller => 'admin/menus', :action => 'edit', :id => @dish.menu_id 
    else
      render 'admin/dishes/new'
    end
  end
  
  def destroy
    dish = Dish.find(params[:id])
    menu_id = dish.menu_id
    dish.destroy
      flash[:notice] = "Successfully deleted dish"
      redirect_to :controller => 'admin/menus', :action => 'edit', :id => menu_id
  end
  
  def destroy_child
    raise params.inspect
    @dish = Dish.find(params[:dish_id])
    @dish_parent = @dish.parent_id
    @dish.destroy
      flash[:notice] = "Successfully deleted sub category"
      redirect_to :controller => 'admin/dishes', :action => 'edit', :id => @dish_parent
  end
  
  def update_individual
    if params[:delete]
      dish_id = params[:delete].keys.first
      dish = Dish.find(dish_id)
      parent_id = dish.parent.id
      dish.destroy
      redirect_to :controller => 'admin/dishes', :action => 'edit', :id => parent_id
    elsif params[:commit] == "Add new sub section"
      @parent_dish = params[:parent_id]
      @dish = Dish.new(:parent_id => @parent_dish)
      if @dish.save
        redirect_to :controller => 'admin/dishes', :action => 'edit', :id => @parent_dish
      else
        redirect_to :controller => 'admin/menus', :action => 'index'
      end
    else
    Dish.update(params[:products].keys, params[:products].values)
      flash[:notice] = "Dishes updated"
      redirect_to :controller => 'admin/menus', :action => 'edit', :id => 43
    end
  end
  
  def add_child
    @parent_dish = params[:parent_id]
    @dish = Dish.new(:parent_id => @parent_dish)
    if @dish.save
      redirect_to :controller => 'admin/dishes', :action => 'edit', :id => @parent_dish
    else
      redirect_to :controller => 'admin/menus', :action => 'index'
    end
    
  end

end