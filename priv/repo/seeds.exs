# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bodegacats.Repo.insert!(%Bodegacats.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Bodegacats.Cats.Cat
alias Bodegacats.Images.Image
alias Bodegacats.Accounts.User

[seed_user_1, seed_user_2] = [
  Bodegacats.Repo.insert!(%User{
    name: "Robert Deals",
    email: "bobby@deals.biz",
    sub: "google|123"
  }),
  Bodegacats.Repo.insert!(%User{
    name: "Geoffrey Business",
    email: "geoff@deals.biz",
    sub: "github:456"
  })
]

[seed_cat_1, seed_cat_2, _seed_cat_3] = [
  Bodegacats.Repo.insert!(%Cat{
    lat: 40.6904125,
    lng: -73.9933927,
    created_by: seed_user_1.id
  }),
  Bodegacats.Repo.insert!(%Cat{
    lat: 40.717517,
    lng: -73.9838227,
    created_by: seed_user_1.id
  }),
  Bodegacats.Repo.insert!(%Cat{
    lat: 40.712379,
    lng: -73.9501757,
    created_by: seed_user_2.id
  })
]

Bodegacats.Repo.insert!(%Image{
  original_path:
    "https://cms.prod.nypr.digital/images/62726/fill-640x426%7Cformat-jpeg%7Cjpegquality-80/",
  created_by: seed_user_1.id,
  cat: seed_cat_1
})

Bodegacats.Repo.insert!(%Image{
  original_path:
    "https://cms.prod.nypr.digital/images/62726/fill-640x426%7Cformat-jpeg%7Cjpegquality-80/",
  created_by: seed_user_1.id,
  cat: seed_cat_2
})

Bodegacats.Repo.insert!(%Image{
  original_path:
    "https://cms.prod.nypr.digital/images/62726/fill-640x426%7Cformat-jpeg%7Cjpegquality-80/",
  created_by: seed_user_2.id,
  cat: seed_cat_2
})
