Rails.application.routes.draw do
  # We want the flats index page to be the very first thing
  # the user sees when they go to localhost:3000
  root to: "flats#index"
end
