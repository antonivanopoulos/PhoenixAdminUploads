defmodule UploadTest.ExAdmin.Item do
  use ExAdmin.Register

  register_resource UploadTest.Item do
    show question do
      attributes_table do
        row :name
        row :category
        row :resource, [], fn(i) ->
          "<img src=\"#{UploadTest.Resource.url({i.resource, i}, :original, signed: true)}\" />"
        end
        row :vector, [], fn(i) ->
          %HTTPoison.Response{body: body} = HTTPoison.get!(UploadTest.Vector.url({i.vector, i}, :original, signed: true))
          body
        end
      end
    end

    form item do
      inputs do
        input item, :name
        #input item, :category
        input item, :resource
        input item, :vector
      end
    end
  end
end
