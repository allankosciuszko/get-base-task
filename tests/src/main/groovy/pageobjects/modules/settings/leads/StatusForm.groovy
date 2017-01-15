package pageobjects.modules.settings.leads

import geb.Module

class StatusForm extends Module {
    static base = { $(".form") }

    static content = {
        name { $("input[type='text']") }
        saveButton { $(".btn.save") }
        cancelButton { $("a.cancel") }
    }
}
