// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require rails.validations
//= require_tree .

window.ClientSideValidations.formBuilders = {
  'ActionView::Helpers::FormBuilder': {
    add: function(element, settings, message) {
      var errorElement, wrapper;

      settings.wrapper_tag = ".control-group";
      settings.error_tag = "span";
      settings.error_class = "help-inline";
      settings.wrapper_error_class = "error";
      settings.wrapper_success = "success";

      if (element.data('valid') !== false) {
        wrapper = element.closest(settings.wrapper_tag);
        wrapper.removeClass(settings.wrapper_success);
        wrapper.addClass(settings.wrapper_error_class);
        errorElement = $("<" + settings.error_tag + "/>", {
          "class": settings.error_class,
          text: message
        });
        return wrapper.find(".controls").append(errorElement);
      } else {
        wrapper = element.closest(settings.wrapper_tag);
        wrapper.addClass(settings.wrapper_error_class);
        return element.parent().find("" + settings.error_tag + "." + settings.error_class).text(message);
      }
    },
  remove: function(element, settings) {
    var errorElement, wrapper;

    settings.wrapper_tag = ".control-group";
    settings.error_tag = "span";
    settings.error_class = "help-inline";
    settings.wrapper_error_class = "error";
    settings.wrapper_success = "success";

    wrapper = element.closest("" + settings.wrapper_tag + "." + settings.wrapper_error_class);
    wrapper.removeClass(settings.wrapper_error_class);
    wrapper.addClass(settings.wrapper_success);
    errorElement = wrapper.find("" + settings.error_tag + "." + settings.error_class);
    return errorElement.remove();
  }
}
};