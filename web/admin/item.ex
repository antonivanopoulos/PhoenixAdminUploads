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
      end
    end

    form item do
      inputs do
        input item, :name
        #input item, :category
        input item, :resource
      end
    end
  end
end
