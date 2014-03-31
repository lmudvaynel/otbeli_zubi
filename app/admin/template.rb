# encoding: utf-8
ActiveAdmin.register Template do
  menu :priority => 0  

  index do
    column :name
    column :content
    default_actions
  end

  form do |f|
    f.inputs "Наполнение" do
      f.input :name
      f.input :content, as: :ckeditor 
    end    
    f.actions
  end
#form partial: 'form'
end