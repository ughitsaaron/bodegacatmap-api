defmodule Bodegacats.UploadController do
  use BodegacatsWeb, :controller

  alias ExAws.S3

  def upload_image(conn, %{"image" => image}) do
    bucket = Application.fetch_env!(:bodegacats, :bucket_name)
    uuid = Ecto.UUID.generate()
    s3_path = Path.join(["bodegacats", "original", "#{uuid}.jpg"])

    image.path
    |> S3.Upload.stream_file()
    |> S3.upload(bucket, s3_path)
    |> ExAws.request!()

    s3_url = URI.merge("http://#{bucket}.s3.amazonaws.com", s3_path) |> to_string()

    json(conn, %{id: uuid, url: s3_url})
  end

  def upload_image(conn, _params) do
    put_status(conn, 400)
    |> json(%{error: "bad request"})
  end
end
