class FishResource < Avo::BaseResource
  self.title = :name
  self.includes = []

  self.search_query = ->(params:) do
    scope.ransack(name_eq: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  field :name, as: :text
end
