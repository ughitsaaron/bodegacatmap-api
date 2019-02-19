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
alias Bodegacats.Accounts.User

[seed_user_1, seed_user_2] = [
  Bodegacats.Repo.insert!(%User{
    name: "Robert Deals",
    email: "bobby@deals.biz",
    openid_sub: "google|123"
  }),
  Bodegacats.Repo.insert!(%User{
    name: "Geoffrey Business",
    email: "geoff@deals.biz",
    openid_sub: "github:456"
  })
]

Bodegacats.Repo.insert!(%Cat{
  lat: 40.6904125,
  lng: -73.9933927,
  created_by: seed_user_1.id
})

Bodegacats.Repo.insert!(%Cat{
  lat: 40.717517,
  lng: -73.9838227,
  created_by: seed_user_1.id
})

Bodegacats.Repo.insert!(%Cat{
  lat: 40.712379,
  lng: -73.9501757,
  created_by: seed_user_2.id
})
