# Pin npm packages by running ./bin/importmap

# pin "application"
# pin "@hotwired/turbo-rails", to: "turbo.min.js"
# pin "@hotwired/stimulus", to: "stimulus.min.js"
# pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
# pin_all_from "app/javascript/controllers", under: "controllers"
# pin "three" # @0.172.0
# pin "@studio-freight/lenis", to: "@studio-freight--lenis.js" # @1.0.42
# pin "animation", to: "animation.js"


pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Пакеты, установленные через npm
pin "three", to: "three.module.min.js"
# pin "lenis", to: "lenis.min.js"


# pin "animation", to: "animation.js"

pin "toggle_password", to: "toggle_password.js"
