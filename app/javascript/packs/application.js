import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "./load_diagnosis_items.js"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
