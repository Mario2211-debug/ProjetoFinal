window.Rails = require("@rails/ujs")
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "controllers"

Rails.start()
