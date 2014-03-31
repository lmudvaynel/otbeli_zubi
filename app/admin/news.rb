ActiveAdmin.register News do
  menu priority: 4
  config.batch_actions = false

  sortable

  index do
    column :content
    column :published_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :published_at
      f.input :content
    end
    f.actions
  end
end
