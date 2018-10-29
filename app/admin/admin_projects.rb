ActiveAdmin.register Project do
  permit_params :targets, :tasks

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :created_at
    actions
  end

  filter :name
  filter :description
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
    end
    f.actions
  end
end
