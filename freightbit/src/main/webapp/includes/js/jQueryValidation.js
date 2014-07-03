(function ($, W, D) {
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function () {
            //form validation rules
            $("#register-form").validate({
                rules: {
                    firstName: "required",
                },
                messages: {
                    firstName: "First name is required",
                },
                submitHandler: function (form) {
                    form.submit();
                }
            });
        }
    }

    //when the dom has loaded setup form validation rules
    $(D).ready(function ($) {
        JQUERY4U.UTIL.setupFormValidation();
    });

})(jQuery, window, document);