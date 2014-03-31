# encoding: utf-8
ActiveAdmin.register Page do
  menu :priority => 0  
  config.batch_actions = false
  config.sort_order = 'position_asc'

  sortable

  controller do
    def new
      @page = Page.new
      @page.build_seo   # без этой строки не появляется форма для seo параметров
    end

    def edit
      @page = Page.find(params[:id])
      if @page.seo_id.nil?
        @page.build_seo
      end
    end
  end
  
  index do
    sortable_handle_column
    column :position, :sortable => :position
    column :name
    column :slug
    column "Родительская страница" do |dc|
      link_to Page.find(dc.parent_id).name , admin_page_path(Page.find(dc.parent_id).slug) if !dc.parent_id.nil?
    end
    default_actions
  end

  form do |f|
    f.inputs "Наполнение" do
      f.input :name
      f.input :slug 
      f.input :parent_id, as: :select,
        collection: Hash[Page.all.map{|page| ["#{page.name}", page.id]}] 
      f.input :left_content, as: :ckeditor 
      if f.object.slug != "contacts" and f.object.slug != "history_8" and !(f.object.slug =~ /technology+(_\d+|)/)
        f.input :right_content, as: :ckeditor
      end
    end 

    if f.object.slug =~ /bleach+(_\d+|)/
      f.inputs do
        f.has_many :bleach_images do |p|
          p.input :price
          unless p.object.new_record?
            p.input :_destroy, :as => :boolean, :label => "Удалить изображение?", :required => false
          end
          p.input :image, :as => :file, :hint => p.object.image.present? \
            ? image_tag(p.object.image.url(:original))
            : p.template.content_tag(:span, "Изображение отсутствует"), :required => false
        end
      end
    end
    f.inputs "СЕО", :for => [:seo, f.object.seo || Seo.new] do |seo|
      seo.input :title 
    
      seo.input :description
      seo.input :keywords
    end
    f.actions
  end
#form partial: 'form'
end
