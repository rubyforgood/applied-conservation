ActiveAdmin.register HealthRatingType do
  permit_params :name, :score, :weight, :threshold_min, :threshold_max, :created_by_id, :updated_by_id

  index do
    selectable_column
    id_column
    column :name
    column :score
    column :weight
    column :threshold_min
    column :threshold_max
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :score
      f.input :weight
      f.input :threshold_min
      f.input :threshold_max
      # f.hidden_field :created_by_id, value: User.first.id # FIXME
      # f.hidden_field :updated_by_id, value: User.first.id # FIXME

      f.input :created_by_id, :input_html => { :value => User.first.id }, as: :hidden
      f.input :updated_by_id, :input_html => { :value => User.first.id }, as: :hidden
    end
    f.actions
  end
end